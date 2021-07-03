pkgname='enpass-bin'
_pkgname='enpass'
pkgver=6.6.3.835
pkgrel=1
pkgdesc='A multiplatform password manager'
arch=('x86_64')
url='http://enpass.io/'
license=('custom')
depends=('libxss' 'lsof' 'curl' 'libxkbcommon-x11')
optdepends=('libxdg-basedir: Open links in the default browser.'
            'libqtxdg: Open links in the default browser (Qt implementation)')
provides=("${_pkgname}")
install='enpass-bin.install'
source=("https://apt.enpass.io/pool/main/e/enpass/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('ea8c0e81770913b56266d4ebea3872afa0d593c0f43667ceee2d0fa9a3b8cabf')

# Disable strip as otherwise the browser extension will not work
options=('!strip')

package() {
    # Extract data
    tar xfz "${srcdir}/data.tar.gz" -C "${pkgdir}"

    # Remove unnecessary files which are included in the .deb
    # find "${pkgdir}" -name '*~' -delete

    # Update permissions to match the default system ones
    chmod 755 "${pkgdir}/opt/"
    find "${pkgdir}/usr/" -type d -exec chmod 755 {} \;

    # Symlink "runenpass.sh" to "/usr/bin" so it is accessible via cli
    mkdir -p "${pkgdir}/usr/bin"
    ln -s '/opt/enpass/Enpass' "${pkgdir}/usr/bin/enpass"
}


# vim: set syntax=sh:
