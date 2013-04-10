# Contributor: Johannes Dewender  < arch at JonnyJD dot net >
pkgname=addon-sdk-git
pkgver=4646.789d1e0
pkgrel=1
pkgdesc="addon-sdk/jetpack development (master) branch"
url="http://blog.mozilla.com/addons/"
arch=('any')
license=('MPL2')
depends=('python2')
optdepends=('firefox' 'firefox-nightly')
makedepends=('git')
source=('git://github.com/mozilla/addon-sdk.git')
install='addon-sdk.install'
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/addon-sdk"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/addon-sdk"
  grep -Rl python . | xargs sed -ri 's/([^!]|^)python(\s|$)/\1python2\2/g'
}

package() {
  mkdir "${pkgdir}/opt"
  cp -r "${srcdir}/addon-sdk" "${pkgdir}/opt/${pkgname}"
}

# vim:set ts=2 sw=2 et:
