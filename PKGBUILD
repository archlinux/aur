# Maintainer: Cash Brunow <1apfuputl@mozmail.com>
# Contributor: Michael Christoff <wxfanatic@gmail.com>
# Developer: Dan Paulat


pkgname=supercell-wx-bin
pkgver=0.4.9
pkgrel=1
pkgdesc="A NEXRAD Level 2 and Level 3 radar viewing application (Stable Build)"
arch=('x86_64')
url="https://github.com/dpaulat/supercell-wx"
license=('MIT')
makedepends=('jq' 'unzip')
depends=('xcb-util' 'xcb-util-cursor' 'mesa')
provides=("supercell-wx")
conflicts=('supercell-wx')
source=("https://github.com/dpaulat/supercell-wx/releases/download/v${pkgver}-release/supercell-wx-v${pkgver}-linux-x64.tar.gz")
md5sums=('SKIP')

#Commented out because this is a binary file and I do not think the pkgver function was needed. Please comment on AUR if i've gotten this wrong.
#pkgver() {
#    echo "$(curl -s "https://api.github.com/repos/dpaulat/supercell-wx/releases/latest" | jq -r '.tag_name' | sed 's/v//; s/-release//')"
#}

package() {
    # Extract the tar.gz file
    tar -xf "supercell-wx-v${pkgver}-linux-x64.tar.gz" -C "${srcdir}"

    # Confirming the internal structure is correct
    if [[ ! -d "${srcdir}/supercell-wx/bin" || ! -d "${srcdir}/supercell-wx/lib" || ! -d "${srcdir}/supercell-wx/plugins" ]]; then
        echo "Unexpected archive structure."
        return 1
    fi

    # Ensure the destination directory exists
    mkdir -p "${pkgdir}/opt/supercell-wx"

    # Move the entire extracted supercell-wx directory content to /opt/supercell-wx/
    cp -a "${srcdir}/supercell-wx/"* "${pkgdir}/opt/supercell-wx/"

    # Create a symlink in /usr/bin for the new executable script
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/supercell-wx/bin/supercell-wx" "${pkgdir}/usr/bin/supercell-wx"

}
