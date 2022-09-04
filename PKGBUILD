# Maintainer: Alexey Peschany <archlinux at sandboiii dot xyz>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail dot com>
# Based on: Dave Kleinschmidt <dave.f.kleinschmidt at gmail dot com>
pkgname=spaceship-prompt
pkgver=4.2.0
pkgrel=2
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
sha256sums=('717e82f52959a74e4586a687cfcc14a761415c957b334276aa118b5738e405ad'
         '2d022de82c32fb4965a1209aac346c6d9736e635a6c9dc653b1288b6b8f65cde')

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
