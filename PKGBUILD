# Maintainer: Swift Geek <swifgeek É google m Ä0m>
# Contributor: Nick Ã˜stergaard <oe.nick at gmail dot com>

pkgname=gputest
pkgver=0.5.0
pkgrel=0
pkgdesc="cross-platform GPU stress test and OpenGL benchmark. Contains FurMark, TessMark"
arch=('x86_64')
url="http://www.geeks3d.com/gputest/"
license=('custom:freeware')
depends=()
#source=("http://www.ozone3d.net/gputest/dl/GpuTest_Linux_x64_${pkgver}.zip")
#noextract=("GpuTest_Linux_x64_${pkgver}.zip")
md5sums=('bf7a715a8e3f36a648896acbebf5b449')

prepare() {
  cd $srcdir
  # Fetch
  echo $md5s
  wget -c --referer "http://www.geeks3d.com/20130712/gputest-0-5-0-cross-platform-opengl-benchmark-linux-mesa-gallium3d-glibc-windows-macosx/" \
  "http://www.ozone3d.net/gputest/dl/GpuTest_Linux_x64_${pkgver}.zip"
  echo ${md5sums[0]} GpuTest_Linux_x64_${pkgver}.zip | md5sum -c --quiet 
  rm -rf "$srcdir/gputest"
  mkdir "$srcdir/gputest"
  cd "$srcdir/gputest"
  unzip "$srcdir/GpuTest_Linux_x64_${pkgver}.zip"

  cd "$srcdir/gputest"
  sed -i '2icd /opt/gputest/' *.sh

}

package () {
  cd "$srcdir/gputest"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  cp "./EULA.txt" "$pkgdir/usr/share/licenses/$pkgname/"
  install -d "$pkgdir/opt/gputest/data/"
  install -m 755 GpuTest "$pkgdir/opt/gputest/"
  install -m 644 ./data/* "$pkgdir/opt/gputest/data/"
  install -d "$pkgdir/usr/bin/"
  install -m 755 *.sh "$pkgdir/usr/bin/"
}
