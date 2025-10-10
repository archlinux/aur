# Maintainer: venhal <1138706183@qq.com>

pkgname=ctyunclouddeskpublic-bin
pkgver=2.9.1.3843
pkgrel=2
pkgdesc="天翼云电脑linux客户端。电信牛马必备。"
arch=('x86_64')
url="https://www.ctyun.cn/products/cloudcomputer"
license=('proprietary')

depends=(
  'alsa-lib' 'brotli' 'bzip2' 'dbus' 'expat' 'flac' 'fontconfig'
  'gcc-libs' 'glib2' 'glibc' 'icu' 'lame' 'libasyncns' 'libcap'
  'libdrm' 'libffi' 'libglvnd' 'libgudev' 'libogg' 'libpng'
  'libpulse' 'libsndfile' 'libvorbis' 'libx11' 'libxau' 'libxcb'
  'libxcomposite' 'libxcursor' 'libxdamage' 'libxdmcp' 'libxext'
  'libxfixes' 'libxi' 'libxml2' 'libxrandr' 'libxrender' 'libxslt'
  'libxss' 'mpg123' 'nspr' 'nss' 'opus' 'pcre2' 'pixman'
  'systemd-libs' 'util-linux-libs' 'v4l-utils' 'zlib' 'libxml2-legacy'
)

source=("${pkgname}-${pkgver}.deb::https://desk.ctyun.cn/desktop/software/clientsoftware/download/a9c0fc33dba6346061363388fbcce108")
sha256sums=('f9e8e4e016b8d1e7c68e7ee27845986221bc6c1c6aa4ad314999f89ce3be235e')

prepare() {
  tar -xf "$srcdir/data.tar."* -C "$srcdir"
}

package() {
  cp -a "$srcdir/opt" "$srcdir/usr" "$pkgdir/"
  
  _desktop_file=$(find "$pkgdir/usr/share/applications" -type f -name "*.desktop")
  
  if [ -n "$_desktop_file" ]; then
    sed -i 's|^Exec=\(.*\)|Exec=env QT_QPA_PLATFORM=xcb \1|' "$_desktop_file"
  else
    echo "警告：在包里没有找到 .desktop 文件！"
  fi
}
