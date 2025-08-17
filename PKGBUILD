# Maintainer: Boradorka
# Co-maintainer: Nebulosa

pkgname=improve-imgsli
pkgver=6.2.0
pkgrel=1
pkgdesc="Image comparison tool with magnifying glass feature"
arch=(any)
url="https://github.com/Loganavter/$pkgname"
license=(MIT)
depends=(
  hicolor-icon-theme
  python
  python-darkdetect
  python-markdown
  python-pillow
  python-pyqt6
  sh
)
makedepends=(
  python-build
  python-installer
  python-pip
  python-wheel
)
optdepends=(
  'python-desktop-notifier: enhanced system notifications'
)
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('84fc283c425dd65daa927ed8412835168d7cd10c49f6a3b160108b1aa47448a7e6d415b0c70d0f39255e41b49cc9541c0e731102a1046b2d94ee02d64656b5ae')
b2sums=('1f181c97f4511c4ed3b0cbcb2820400d5d72a9e264b9aa9901748ad54d58da69177f4c630156ba94ae37cd6fd6a91b0b0cdb8a7b7daa272ccedd63c5451ea59d')

prepare() {
  #Making launching app more secure
  sed -i "s|^Exec=$pkgname|Exec=/usr/bin/$pkgname|" "$srcdir"/Improve-ImgSLI-$pkgver/build/AUR-template/$pkgname.desktop
}

package() {
  cd "$srcdir"/Improve-ImgSLI-$pkgver

  # Install launcher, desktop file, icon, and license
  install -vDm 755 build/AUR-template/launcher.sh          "$pkgdir"/usr/bin/$pkgname
  install -vDm 644 build/AUR-template/$pkgname.desktop  -t "$pkgdir"/usr/share/applications/
  install -vDm 644 src/resources/icons/icon.png            "$pkgdir"/usr/share/icons/hicolor/512x512/apps/$pkgname.png
  install -vDm 644 LICENSE.txt                             "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  # Install application source code
  install -vDm 644 src/__init__.py                      -t "$pkgdir"/usr/lib/$pkgname/
  install -vDm 644 src/__main__.py                      -t "$pkgdir"/usr/lib/$pkgname/

  install -vDm 644 src/core/*.py                        -t "$pkgdir"/usr/lib/$pkgname/core/
  install -vDm 644 src/events/*.py                      -t "$pkgdir"/usr/lib/$pkgname/events/
  install -vDm 644 src/image_processing/*.py            -t "$pkgdir"/usr/lib/$pkgname/image_processing/
  install -vDm 644 src/image_processing/drawing/*.py    -t "$pkgdir"/usr/lib/$pkgname/image_processing/drawing/
  install -vDm 644 src/ui/*.py                          -t "$pkgdir"/usr/lib/$pkgname/ui/
  install -vDm 644 src/ui/dialogs/*.py                  -t "$pkgdir"/usr/lib/$pkgname/ui/dialogs/
  install -vDm 644 src/ui/managers/*.py                 -t "$pkgdir"/usr/lib/$pkgname/ui/managers/
  install -vDm 644 src/ui/presenters/*.py               -t "$pkgdir"/usr/lib/$pkgname/ui/presenters/
  install -vDm 644 src/ui/widgets/*.py                  -t "$pkgdir"/usr/lib/$pkgname/ui/widgets/
  install -vDm 644 src/ui/widgets/atomic/*.py           -t "$pkgdir"/usr/lib/$pkgname/ui/widgets/atomic/
  install -vDm 644 src/ui/widgets/composite/*.py        -t "$pkgdir"/usr/lib/$pkgname/ui/widgets/composite/
  install -vDm 644 src/ui/widgets/helpers/*.py          -t "$pkgdir"/usr/lib/$pkgname/ui/widgets/helpers/
  install -vDm 644 src/utils/*.py                       -t "$pkgdir"/usr/lib/$pkgname/utils/
  install -vDm 644 src/workers/*.py                     -t "$pkgdir"/usr/lib/$pkgname/workers/

  # Install resources
  install -vDm 644 src/resources/translations.py        -t "$pkgdir"/usr/lib/$pkgname/resources/
  install -vDm 644 src/resources/assets/circle_mask.png -t "$pkgdir"/usr/lib/$pkgname/resources/assets/
  install -vDm 644 src/resources/assets/icons/*.svg     -t "$pkgdir"/usr/lib/$pkgname/resources/assets/icons/
  install -vDm 644 src/resources/fonts/*.ttf            -t "$pkgdir"/usr/lib/$pkgname/resources/fonts/
  install -vDm 644 src/resources/icons/icon.png         -t "$pkgdir"/usr/lib/$pkgname/resources/icons/
  install -vDm 644 src/resources/styles/*.qss           -t "$pkgdir"/usr/lib/$pkgname/resources/styles/
}
