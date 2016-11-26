# Maintainer: Mrmaxmeier <Mrmaxmeier+aur at gmail dot com>
# TODO: dynamically choose between /builds/.. and /builds/old/..

pkgname=bombsquad
pkgver=1.4.105
pkgrel=1
pkgdesc='An explosive arcade-style party game'
arch=('x86_64' 'i686')
url='http://www.froemling.net/apps/bombsquad'
license=('unknown')
depends=('openal' 'libgl' 'sdl2' 'gcc' 'libvorbis' 'libogg' 'libxau')
source=("bombsquad.sh")
sha256sums=('850f8a66eb045ce833f8d7dae4533f69b629ac648bd205d98bf5f851339d4515')

source_i686=("http://www.files.froemling.net/bombsquad/builds/BombSquad_Linux_32bit_${pkgver}.tar.gz")
sha256sums_i686=('775bd784d3b8a8c6083afaa78e9d87b7016d2b7a58819e94b17dba84f9388948')

source_x86_64=("http://www.files.froemling.net/bombsquad/builds/BombSquad_Linux_64bit_${pkgver}.tar.gz")
sha256sums_x86_64=('9f7ed844fb9bd24db8c10e0d12c491f2270925a331c3283512dfb14b6d484306')


package() {
  case "$CARCH" in
  x86_64)
    cd "$srcdir"/BombSquad_Linux_64bit_"$pkgver"
    ;;
  i686)
    cd "$srcdir"/BombSquad_Linux_32bit_"$pkgver"
    ;;
  esac

  install -Dm755 bombsquad "$pkgdir"/usr/share/bombsquad/bombsquad
  install -dm755 data "$pkgdir"/usr/share/bombsquad/data
  cp -r data "$pkgdir"/usr/share/bombsquad/

  find "${pkgdir}/usr/share/bombsquad/data" -type f -exec chmod 644 {} \;
  find "${pkgdir}/usr/share/bombsquad/data" -type d -exec chmod 755 {} \;

  install -Dm 755 "$srcdir"/bombsquad.sh "$pkgdir"/usr/bin/$pkgname
}


