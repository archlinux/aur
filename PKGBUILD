# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
# Contributor: Jonathan Steel <jsteel at aur.archlinux.org>
# Contributor: Robert Djubek <envy1988@gmail.com>
_pkgname=uppity
pkgname=$_pkgname-git
pkgver=0.r12.5043001
pkgrel=1
pkgdesc="The pastebin client with an attitude"
arch=('any')
url="https://github.com/Kiwi/Uppity"
license=('MIT')
depends=('lua51-socket')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=('curlpaste')
backup=('etc/uppity.conf')
source=("$_pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  sed -i "s|/usr/bin/env lua|/usr/bin/env lua5.1|g" "$_pkgname"
}

package() {
  cd "$_pkgname"
  install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
  install -Dm644 $_pkgname.conf "$pkgdir"/etc/$_pkgname.conf
  install -dm755 "$pkgdir"/etc/$_pkgname.d/
  install -m644 $_pkgname.d/* "$pkgdir"/etc/$_pkgname.d/
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
