pkgname='enpass-bin'
_pkgname='enpass'
pkgver=6.7.4.933
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
sha256sums=('ea79f0423aa3f4fda591d2e16f24c1bc561a36b12a69553a74dc26006f307add')

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
