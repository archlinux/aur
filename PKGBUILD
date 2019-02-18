# Maintainer: Enno Lohmeier
pkgname=systemdjournal2gelf
binname=SystemdJournal2Gelf
pkgver=0.r39.8b37b7b
pkgrel=1
pkgdesc="Export entries from systemds' journal and send them to a graylog server using gelf"
arch=('any')
url="https://github.com/parse-nl/systemdjournal2gelf"
license=('custom: Simplified BSD')
makedepends=('git' 'go')
source=('git+https://github.com/parse-nl/systemdjournal2gelf.git' 'systemdjournal2gelf.conf' 'systemdjournal2gelf.service')
md5sums=('SKIP'
         'b1d36faab737f215df43167a0fc9d3ff'
         'bad7f3eb935eb50f00e2b63be3b3c6a3')
pkgver() 
{
  cd "$pkgname"
  echo "0.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  go get github.com/DECK36/go-gelf/gelf
  go build
}

package()
{
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/etc
  mkdir -p $pkgdir/etc/systemd/system
 
  install -Dm644 $pkgname.conf "$pkgdir/etc/$pkgname.conf"
  install -Dm644 $pkgname.service "$pkgdir/etc/systemd/system/$pkgname.service"

  cd "$pkgname"
  install -Dm755 "$binname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
