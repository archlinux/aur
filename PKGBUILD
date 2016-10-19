# Maintainer: Simon Doppler (dopsi) <dop.simon@gmail.com>
pkgname=security-mailer-git
pkgver=r6.d7c5429
pkgrel=1
pkgdesc='arch-audit digest sender'
conflicts=('security-mailer')
provides=('security-mailer')
arch=('any')
url='http://github.com/dopsi/security-mailer'
license=('GPL3')
depends=('arch-audit' 'python')
source=('git://github.com/dopsi/security-mailer')
sha1sums=('SKIP')

_gitname=security-mailer
pkgver() {
    cd $_gitname
    git checkout $_branch >> /dev/null
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_gitname"
    git checkout $_branch
    python setup.py install --root=${pkgdir}
    install -d ${pkgdir}/etc/security-mailer
    install -m 644 config.json ${pkgdir}/etc/security-mailer/config.json
}

# vim:ts=4:sw=4:expandtab
