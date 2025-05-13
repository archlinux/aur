# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
# Contributor: kaptoxic
# Contributor: sseneca
# Contributor: Gustavo A. Gomez Farhat <gustavo_dot_gomez_dot_farhat at gmail_dot_com>

pkgname=rodin
pkgver=3.9
_pkgver_upstream=3.9.0.202406100806-9b87fe13d
pkgrel=1
pkgdesc="Tool for cost effective rigorous development of dependable software systems"
arch=('x86_64')
url="http://www.event-b.org"
license=('CPL' 'EPL')
depends=('python' 'libxrender' 'fontconfig' 'java-runtime')
source=('rodin.desktop')
md5sums=('b9941b26369aff6665dcde43091ebef9'
         '8ad00aa394a82b03bc513ffceebd8f68')
sha256sums=('aa4c0909b4e156f20882a1b861c6a7b37d144a18e9fe7fa00088b9dc2f586d75'
            'e8809ee898017ad1ad4fe354fe5d7867427e2d568dc051fa2fa4338c3f417e79')

source+=(http://downloads.sourceforge.net/project/rodin-b-sharp/Core_Rodin_Platform/${pkgver}/rodin-${_pkgver_upstream}-linux.gtk.$CARCH.tar.gz)

package() {
  cd $srcdir/$pkgname
  mkdir -p $pkgdir/opt/rodin || return 1
  cp -rf ./* $pkgdir/opt/rodin || return 1

  # remove unneeded files
  rm -rf $pkgdir/opt/rodin/plugins/com.sun.jna_5.13.0.v20230812-1000/com/sun/jna/{linux-{aarch64,arm,armel,loongarch64,mips64el,ppc,ppc64le,riscv64,s390x},aix-ppc,aix-ppc64,darwin-aarch64,darwin-x86-64,freebsd-x86,freebsd-x86-64,openbsd-x86,openbsd-x86-64,sunos-{sparc,sparcv9,x86,x86-64},win32,win32-{aarch64,x86,x86-64}}

  mkdir -p $pkgdir/usr/share/pixmaps
  install $pkgdir/opt/rodin/icon.xpm $pkgdir/usr/share/pixmaps/rodin.xpm
  mkdir -p $pkgdir/usr/share/applications
  install -m 755 $srcdir/rodin.desktop $pkgdir/usr/share/applications/rodin.desktop
  #install -m 755 -D $srcdir/rodin.profile $pkgdir/etc/profile.d/rodin.sh
}
