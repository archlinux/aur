pkgname=vide-bin
pkgver=0.45a
pkgrel=1
pkgdesc='A toolkit for the Source engine aimed at aiding mappers and modders alike.'
arch=('x86_64')
url='http://www.riintouge.com/VIDE/'
license=('unknown')
depends=('icu67' 'qt4' 'lcms2' 'freetype2' 'liblqr' 'glib2' 'fontconfig' 'libxext' 'libxt' 'xz' 'bzip2' 'zlib' 'libtool' 'libx11')
makedepends=('patchelf')
source=('http://www.riintouge.com/archive/VIDE/VIDE_latest_64.tar.gz'
        'http://www.riintouge.com/archive/VIDE/lib64/libMagick++.so.5'
        'http://www.riintouge.com/archive/VIDE/lib64/libMagickCore.so.5'
        'http://www.riintouge.com/archive/VIDE/lib64/libMagickWand.so.5'
        'vide-wrapper'
        'VIDE.desktop'
        'vide.xml')
sha512sums=('82dc328bca33cdce139131132f18bc2e9a2776af648fcce0850aadb19a02593c906eb6b15b266067e4f184b1c0a76d0f41f7df5bc08e3311988351f4f1425dde'
            'a36802b973935ceb372ccb97054fe3b95ed6b403c496601efd22f8f342065838a09263649e699de0dbfd9f94084306f3f17000caf127eaf2ce5d7980580a7def'
            '974a423686c95a10b108466532dfca7aad714bfc39c5dcc5b343bd27ccce0cfc0510aea8af396a1adb2143f5c04e4a78df44d5b150638dc8109d7c6249694a2a'
            '9fd337fd08e0e2c98d21e132b4e5af01c4f21d077b0f39225fe0657b974c7c58f6b194c8e907def127ff84c35c7f1a42e52ac21d83e0d778ce43f4c14638ac0a'
            'SKIP'
            'SKIP'
            'SKIP')

build() {
  patchelf --remove-rpath VIDE/VIDE
}

package() {
  install -Dm755 vide-wrapper "$pkgdir/usr/bin/VIDE"
  install -Dm755 VIDE/VIDE "$pkgdir/usr/lib/vide/VIDE"
  install -Dm755 -t "$pkgdir/usr/lib/vide/" VIDE/lib/libSingleApplication.so.1 libMagick++.so.5 libMagickCore.so.5 libMagickWand.so.5
  install -Dm644 VIDE/noitazilait.ini "$pkgdir/usr/lib/vide/noitazilait.ini"

  install -Dm755 VIDE.desktop "$pkgdir/usr/share/applications/VIDE.desktop"
  install -Dm644 vide.xml "$pkgdir/usr/share/mime/packages/vide.xml"
  install -Dm644 VIDE/deploy/multi_manager_icon_48.png "$pkgdir/usr/share/pixmaps/multi_manager_icon_48.png"
}
