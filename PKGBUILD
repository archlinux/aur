# Maintainer: Alexey Peschany <archlinux at sandboiii dot xyz>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail dot com>
# Contributor: Dave Kleinschmidt <dave.f.kleinschmidt at gmail dot com>

pkgname=spaceship-prompt
pkgver=4.19.1
pkgrel=1
pkgdesc="A Zsh prompt for Astronauts"
arch=('any')
url="https://spaceship-prompt.sh/"
license=('MIT')
depends=('zsh')
makedepends=('git')
provides=('spaceship-zsh-theme' 'spaceship-prompt')
install="${pkgname}.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz"
        "$pkgname.install")
sha256sums=('c74c24b899df46656dfce56e330e5a70801bd54dcf3ebac877f99c1ce7b07c63'
            '9fb9218c6498c040461d8d7aa416b2eb9241317b5606e74d1ec1caed0709aaf4')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    find docs -type f -exec install -D -m644 {} "${pkgdir}/usr/share/doc/${pkgname}/{}" \;

    find lib -type f -exec install -D -m644 {} "${pkgdir}/usr/lib/${pkgname}/{}" \;
    find scripts -type f -exec install -D -m644 {} "${pkgdir}/usr/lib/${pkgname}/{}" \;
    find sections -type f -exec install -D -m644 {} "${pkgdir}/usr/lib/${pkgname}/{}" \;
    install -D -m644 spaceship.zsh "${pkgdir}/usr/lib/${pkgname}/spaceship.zsh"
    install -D -m644 async.zsh "${pkgdir}/usr/lib/${pkgname}/async.zsh"
    ln -s spaceship.zsh "${pkgdir}/usr/lib/${pkgname}/spaceship.zsh-theme"

    install -d "${pkgdir}/usr/local/share/zsh/site-functions/"
    ln -s "/usr/lib/${pkgname}/spaceship.zsh" "${pkgdir}/usr/local/share/zsh/site-functions/prompt_spaceship_setup"
}
