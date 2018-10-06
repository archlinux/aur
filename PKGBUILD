pkgname='enpass-beta-bin'
_pkgname='enpass-beta'
pkgver=6.0.0.149
pkgrel=1
pkgdesc='A multiplatform password manager'
arch=('x86_64')
url='http://enpass.io/'
license=('custom')
depends=('libxss' 'lsof')
provides=("${_pkgname}")
install='enpass-beta-bin.install'
source=("http://repo.sinew.in/pool/main/e/enpass-beta/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('e2712de4ff26ffc20bed7c52fbf3b93b983b495bdaadabeae72a839ce99e6d0b')

# Disable strip as otherwise the browser extension will not work
#options=('!strip')

package() {
    # Extract data
    tar xfz "${srcdir}/data.tar.gz" -C "${pkgdir}"

    # Update permissions to match the default system ones
    chmod 755 "${pkgdir}/opt/"
    find "${pkgdir}/usr/" -type d -exec chmod 755 {} \;

    # Symlink "runenpass.sh" to "/usr/bin" so it is accessible via cli
    mkdir -p "${pkgdir}/usr/bin"
    ln -s '/opt/enpass-beta/Enpass6' "${pkgdir}/usr/bin/enpass-beta"
}


# vim: set syntax=sh:
