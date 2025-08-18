# Maintainer: Alexander Jacocks <alexander@redhat.com>
pkgname=trs80gp-bin
_pkgname=trs80gp
pkgver=2.5.5
pkgrel=1
pkgdesc="A TRS-80 Model 1,2,3,4,12,16,6000,MC-10,Color Computer,DT-1,Videotex Emulator"
arch=('x86_64')
url="http://48k.ca/trs80gp.html"
license=('AS IS')
depends=(
  'brotli'
  'bzip2'
  'dbus'
  'expat'
  'glib2'
  'icu'
  'libcap'
  'libffi'
  'libxml2'
  'pcre2'
  'sqlite'
  'systemd-libs'
  'util-linux-libs'
  'xz'
  'zlib'
  'zstd'
  'at-spi2-core'
  'cairo'
  'flac'
  'fontconfig'
  'freetype2'
  'fribidi'
  'gdk-pixbuf2'
  'graphite'
  'gtk3'
  'harfbuzz'
  'jbigkit'
  'json-glib'
  'lame'
  'libasyncns'
  'libcloudproviders'
  'libdatrie'
  'libepoxy'
  'libjpeg-turbo'
  'libogg'
  'libpng'
  'libpulse'
  'libsndfile'
  'libthai'
  'libtiff'
  'libvorbis'
  'libx11'
  'libxau'
  'libxcb'
  'libxcomposite'
  'libxcursor'
  'libxdamage'
  'libxdmcp'
  'libxext'
  'libxfixes'
  'libxi'
  'libxinerama'
  'libxkbcommon'
  'libxrandr'
  'libxrender'
  'mpg123'
  'opus'
  'pango'
  'pixman'
  'tracker3'
  )
source=(
  ${_pkgname}-${pkgver}.zip::"http://48k.ca/${_pkgname}-${pkgver}.zip"
  'LICENSE'
  'trs80gp.desktop'
  'trs80gp.man'
  'AppIcon.appiconset.zip'
  )
sha256sums=('753787bc4f7937f58bda26438922f26bb67d98c2f4ff182f12c035c1685a41f0'
            '09254eb4ab4b07a7604ac26bf87a8f64873671abb3d2de07603e2e28064788c0'
            'b5786dc40374acbbf2891db508bb373a5d3678c8c2e5524bdb92d2c01b1425c4'
            '8f1a877dea80f8ea19e8aa277b8348caeed9307bcdc9e4e65d14a9f90f1bc48b'
            '754881dfe2170c05621a7ef5421c025f4504a9b2349559947d03f3a837892a67')

package() {
  for size in 16 32 64 128 256 512; do
    install -Dm644 "AppIcon.appiconset/icon_${size}x${size}.png" "$pkgdir"/usr/share/icons/hicolor/${size}x${size}/apps/${_pkgname}.png
  done
  sed -e "s/^Version=.*/Version=${pkgver}/" ${_pkgname}.desktop > ${_pkgname}.desktop.install
  install -Dm644 "$srcdir/${_pkgname}.desktop.install" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir"/usr/share/doc/${_pkgname}/LICENSE
  install -Dm755 "$srcdir/linux-64/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  # install man pages
  install -Dm755 ${_pkgname}.man "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
