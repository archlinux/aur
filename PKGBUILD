# Maintainer: Clément Junca <cju.arch@gmail.com>
# Maintainer: Jeff Parent <jecxjo@sdf.lonestar.org>
pkgname=feather-git
pkgver=30.503fb9f
pkgrel=1
pkgdesc="A tarsnap script that performs and maintains a set of backups as defined by a yaml configuration file"
arch=('any')
url="https://github.com/danrue/feather"
license=('custom:beerware')
depends=('tarsnap' 'python2-yaml')
makedepends=('git')
install='feather.install'
source=('git://github.com/danrue/feather.git'
        'LICENSE')
md5sums=('SKIP'
         '11e83d27bfac8416111b464909fc9adf')

pkgver() {
  cd "$srcdir/${pkgname%-*}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "$srcdir/${pkgname%-*}"
  sed -i 's|env python|env python2|' feather
  sed -i 's|binpath: /usr/local/bin/|binpath: /usr/bin/|' feather.yaml.dist
}

package() {
  cd "$srcdir/${pkgname%-*}"
  install -D -m755 feather "$pkgdir/usr/bin/feather"
  install -D -m644 feather.yaml.dist "$pkgdir/usr/share/$pkgname/feather.yaml.dist"
  install -D -m644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
