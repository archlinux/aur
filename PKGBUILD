# Maintainer: Arne Beer <privat@arne.beer>

pkgname=pueue
pkgver='1.0.5'
pkgrel=1
arch=('any')
pkgdesc='A command scheduler for shells'
license=('MIT')
depends=('python-psutil' 'python-daemonize' 'python-terminaltables' 'python-colorclass')
makedepends=('git' 'python-setuptools')
conflicts=('pueue-git')
provides=('pueue')
url='https://github.com/nukesor/pueue'
source=("https://github.com/Nukesor/pueue/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    cd "${pkgname}-${pkgver}"

    # We don't need anything related to git in the package
    rm -rf .git*

    # Install
    python setup.py install --optimize=1 --root="${pkgdir}/"

    # Place systemd user service
    install -Dm644 "utils/${pkgname}.service" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"

    # Install zsh completions file
    install -Dm644 "utils/_pueue" "${pkgdir}/usr/share/zsh/site-functions/_pueue"

    # Install License
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
