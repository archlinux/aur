# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Florian Knodt <f.knodt@yotaweb.de>

pkgname=virtualdub
pkgver=1.10.4
pkgrel=1
pkgdesc='Video editing software (uses the WIN32 API)'
arch=('any')
url='http://www.virtualdub.org/'
license=('GPL2')
depends=('wine')
makedepends=('gendesk')
install="$pkgname.install"
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-win/$pkgver.35491/VirtualDub-$pkgver.zip"
        'virtualdub.sh')
sha256sums=('0502648057fd1345f6755914e5d32bb55230ae63f63cd829298544e9ea5a4b98'
            'c4ea2b1b1cfa585433495e9f4621233461e5d9cd4e26792caa52507b06dafc81')

prepare() {
  gendesk -f --pkgname virtualdub --pkgdesc 'Video editing software (uses the WIN32 API)' --name VirtualDub --categories 'AudioVideo;Multimedia'
}

package() {
  install -d "$pkgdir"/usr/share/{"$pkgname",doc/"$pkgname",pixmaps,applications}
  install -Dm755 virtualdub.sh "$pkgdir/usr/bin/virtualdub"
  install -Dm644 *.exe "$pkgdir/usr/share/$pkgname"
  install -Dm644 *.vdi "$pkgdir/usr/share/$pkgname"
  install -Dm644 *.dll "$pkgdir/usr/share/$pkgname"
  install -Dm644 VirtualDub.chm "$pkgdir/usr/share/doc/$pkgname"
  ln -s "/usr/share/doc/$pkgname/VirtualDub.chm" "$pkgdir/usr/share/$pkgname/VirtualDub.chm"
  cp -r plugins32 aviproxy "$pkgdir/usr/share/$pkgname"
  install -Dm644 virtualdub.png "$pkgdir/usr/share/pixmaps"
  install -Dm644 virtualdub.desktop "$pkgdir/usr/share/applications"
  install -Dm644 copying "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
