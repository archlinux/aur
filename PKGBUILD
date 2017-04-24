pkgname=betterdiscord-git
pkgver=0.2.82.r281.gb92989a
pkgrel=1
pkgdesc='Discord extension that introduces new features like BTTV emotes and plugin support. Git master branch'
arch=('any')
url='https://betterdiscord.net/home/'
license=('MIT')
depends=('discord')
makedepends=('git' 'asar')
install='BetterDiscord.install'
source=("${pkgname%-git}::git+https://github.com/Jiiks/BetterDiscordApp.git" LICENSE)
md5sums=('SKIP'
         '8414480728c5dc0d4ca9a93cfaf67acb')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

package() {
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Get rid of git files.
  cd "${srcdir}/${pkgname%-git}"
  rm -rf ".git"
  rm "./.gitignore"

  install -d "${pkgdir}/usr/lib/${pkgname}/"
  cp -a "./." "${pkgdir}/usr/lib/${pkgname}"
}
