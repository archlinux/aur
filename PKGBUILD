# Maintainer: Donald Webster <fryfrog@gmail.com>
# Conributor: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=bazarr-git
pkgver=1.4.0.r42.g8282899fa
pkgrel=1
pkgdesc="Subtitle management and download automation for Sonarr and Radarr"
arch=('any')
url="https://github.com/morpheus65535/bazarr"
license=('GPL3')
depends=(
  'ffmpeg'
  'python'
  'python-gevent'
  'python-gevent-websocket'
  'python-lxml'
  'python-numpy'
  'python-pillow'
  'python-webrtcvad'
  'sqlite'
  'unrar'
)
makedepends=(
  'unzip'
  'python-setuptools'
  'git'
)
provides=('bazarr')
conflicts=('bazarr')
options=('!strip')
source=(
  'git+https://github.com/morpheus65535/bazarr'
  'bazarr.service'
  'bazarr.sysusers'
  'bazarr.tmpfiles'
  'bazarr.install'
)

sha256sums=('SKIP'
            'fe83f24cdd17b37f19108d93f30b552bc5edbcc23a22f01e9be963f26d7d61d8'
            '92fd48cbd7e5fe3a0388bbe756a52098fc461ef2dc87d9e886452e4f15acdcdc'
            '3aa2ebbf4083301d331f36486edcb81fcd094767a0ea404a89d870217d4f6632'
            '573beeac951d427e980332ce4d8645ae2299082e6c9c04f96e2a41a98c3acc60')

pkgver() {
  cd "bazarr"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -d -m 755 "$pkgdir/usr/lib/bazarr"
  cp -dpr --no-preserve=ownership "$srcdir/bazarr" "${pkgdir}/usr/lib/"
  rm -rf "$pkgdir/usr/lib/bazarr/.git"
  find "$pkgdir/usr/lib/bazarr/" -name '*.gitignore' -delete
  find "$pkgdir/usr/lib/bazarr/" -name '*.gitattributes' -delete

  install -D -m 644 "$srcdir/bazarr.service" "$pkgdir/usr/lib/systemd/system/bazarr.service"
  install -D -m 644 "$srcdir/bazarr.sysusers" "$pkgdir/usr/lib/sysusers.d/bazarr.conf"
  install -D -m 644 "$srcdir/bazarr.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/bazarr.conf"
}
