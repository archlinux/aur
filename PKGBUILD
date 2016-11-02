# Maintainer: Fernando Barillas <fbis251@mailbox.org>
pkgname=wire-desktop-bin
pkgver=2.11.2665
pkgrel=2
pkgdesc='Modern communication, full privacy.'
arch=('i686' 'x86_64')
url='https://wire.com/'
license=('GPL3')
conflicts=('wire-desktop')
depends=('alsa-lib' 'gconf' 'gtk2' 'libxss' 'libxtst' 'nss')
source_i686=("https://wire-app.wire.com/linux/wire-${pkgver}-ia32.deb")
source_x86_64=("https://wire-app.wire.com/linux/wire-${pkgver}-amd64.deb")
sha256sums_i686=('ab6746b400aa7c89aaace100628eaa6e59e44d7830c02a4f1db35ab9447c7643')
sha256sums_x86_64=('08b55650d78670a8ddb56e039181f430db31a294b8fefe3da73f96b8ac661a06')

package() {
  if [ "$CARCH" = "i686" ] ; then
    deb_arch="ia32"
  elif [ "$CARCH" = "x86_64" ] ; then
    deb_arch="amd64"
  else
    echo "Unknown arch: $CARCH"
    exit 1
  fi

  cd "$pkgdir"
  mkdir -p opt etc/profile.d
  echo 'export PATH=$PATH:/opt/Wire' > "etc/profile.d/${pkgname}.sh"
  echo 'setenv PATH ${PATH}:/opt/Wire' > "etc/profile.d/${pkgname}.csh"
  chmod 755 "etc/profile.d/${pkgname}".{csh,sh}

  cd "$srcdir"
  deb_package="wire-${pkgver}-${deb_arch}.deb"
  ar xf "$deb_package"
  tar xf data.tar.xz -C "$pkgdir"
}
