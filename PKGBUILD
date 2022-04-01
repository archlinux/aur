# Maintainer: schuay <jakob.gruber@gmail.com>
# Contributor: Ray Powell <ray_al@xphoniexx.net>

pkgname=mcomix
# Might want to move to date-based versions.
pkgver=1.3.0.dev0
pkgrel=6
pkgdesc="A user-friendly, customizable image viewer specifically designed to handle comic books"
arch=('any')
url="https://github.com/multiSnow/mcomix3"
license=('GPL')
depends=('gtk3' 'python-cairo' 'python-gobject' 'python-pillow')
makedepends=('git')
optdepends=('libunrar: for rar compressed comics'
            'p7zip: for 7z compressed comics'
            'unrar: for rar compressed comics'
            'unzip: for zip compressed comics'
            'lhasa: for lha compressed comics'
            'mupdf-tools: for PDF comics')
_commit=483f4b3f2d9a125606d47597ae7eff3b38e5bf9d  # HEAD as of 20220123.
source=("git+https://github.com/multiSnow/mcomix3.git#commit=$_commit")
md5sums=('SKIP')

package() {
  cd mcomix3

  python installer.py --srcdir=mcomix --target="${pkgdir}"/usr/share

  install -dm755 "$pkgdir"/usr/bin
  ln -s /usr/share/mcomix/mcomixstarter.py "$pkgdir"/usr/bin/mcomix
  ln -s /usr/share/mcomix/comicthumb.py "$pkgdir"/usr/bin/comicthumb

  install -Dm644 mime/mcomix.desktop "$pkgdir"/usr/share/applications/mcomix.desktop
  install -Dm644 mime/mcomix.appdata.xml "$pkgdir"/usr/share/metainfo/mcomix.appdata.xml
  install -Dm644 mime/comicthumb.thumbnailer "$pkgdir"/usr/share/thumbnailers/comicthumb.thumbnailer

  for size in 16x16 22x22 24x24 32x32 48x48
  do
    install -dm755 "$pkgdir"/usr/share/icons/hicolor/$size/apps/
    install -Dm644 mcomix/mcomix/images/$size/mcomix.png "$pkgdir"/usr/share/icons/hicolor/$size/apps/mcomix.png
    install -Dm644 mime/icons/$size/application-x-cb7.png "$pkgdir"/usr/share/icons/hicolor/$size/mimetypes/application-x-cb7.png
    install -Dm644 mime/icons/$size/application-x-cbt.png "$pkgdir"/usr/share/icons/hicolor/$size/mimetypes/application-x-cbt.png
  done

  install -Dm644 man/mcomix.1 "$pkgdir"/usr/share/man/man1/mcomix.1
  install -Dm644 man/comicthumb.1 "$pkgdir"/usr/share/man/man1/comicthumb.1
}
