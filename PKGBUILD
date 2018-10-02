# Maintainer: John Garland <johnnybg+aur@gmail.com>
# Contributor: Ben Widawsky <ben@bwidawsk.net>
# Contributor: Jonathan Arnold <jarnold@buddydog.org>
# Contributor: Marq Schneider <queueRAM@gmail.com>

pkgname=p4v
pkgver=2018.3.1706936
pkgrel=1
pkgdesc="Perforce Visual Client"
arch=('x86_64')
url="http://www.perforce.com"
license=('custom:p4v')
depends=(libxcb)
options=('!strip')
source=(p4v.desktop p4admin.desktop p4merge.desktop LICENSE 
p4v-${pkgver}.tgz::http://cdist2.perforce.com/perforce/r${pkgver:2:4}/bin.linux26x86_64/${pkgname}.tgz)

sha256sums=('1fc7ea925fdcb38915f191b6a9c85fb46db9ef501dbaa077e8f38876c5e8fda0'
            '10e470c6099459a072565494c4fd21cc1f4198f1024fe6fdeb6c77ea7e594827'
            '139c5e4951ea9ab040912ef1f9705de16a37d32fdf7b8c7116eb5a785829c634'
            'c4ed3aef62b1bbf2d16ce4cceb65dc49ab9635b38e2fed0a595fe259283a9f32'
            '5b66c6d5735f69446d842967cef185bc67ba39e948f3413e51a2865a7ecfefe0')

package() {
  cd ${pkgname}-${pkgver}/

  mkdir -p "${pkgdir}"/usr/share/p4v
  mkdir -p "${pkgdir}"/usr/bin

  cp -R * "${pkgdir}"/usr/share/p4v

  # put a pointer in /usr/bin
  ln -s /usr/share/p4v/bin/{p4v,p4merge,p4admin,p4vc} "${pkgdir}"/usr/bin

  # Install icons
  mkdir -p "$pkgdir"/usr/share/icons/hicolor/scalable/apps
  install -Dm644 lib/P4VResources/icons/p4admin.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/p4admin.svg
  install -Dm644 lib/P4VResources/icons/p4merge.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/p4merge.svg
  install -Dm644 lib/P4VResources/icons/p4v.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/p4v.svg

  mkdir -p "${pkgdir}"/usr/share/applications

  cd "$srcdir"
  # Install desktop files
  install -m644 {p4v,p4merge,p4admin}.desktop "${pkgdir}"/usr/share/applications

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
