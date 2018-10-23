# Maintainer: Felix Springer <felixspringer149@gmail.com>

# alias imod-env="IMOD_DIR='/opt/IMOD/'; source '/opt/IMOD/IMOD-linux.sh'"
#
# use this alias to access imod from bash!
# the programs are only after execution of the alias 'imod-env' added to your PATH
# execute the alias 'imod-env' in your '~/.bash_profile' or your shell-profile to be able to access the programs anytime without invoking 'imod-env' first

# the provided programs are listed in 'PROVIDES'

pkgname=imod-binary
pkgver=4.9.10
pkgrel=1
pkgdesc="image processing, modeling and display programs for tomography and 3D reconstruction"
arch=('x86_64')
url="http://bio3d.colorado.edu/imod/"
license=('GPL')
provides=('imod')
depends=('libjpeg6-turbo' 'python')
optdepends=('cuda>=8.0.0: for library bindings'
            'tcsh: for only a few very specializied scripts')
source=('https://bio3d.colorado.edu/imod/AMD64-RHEL5/imod_4.9.10_RHEL7-64_CUDA8.0.sh')
md5sums=('09dea781cbefa60f1b8360ed622ab709')

pkgver() {
  echo "$pkgver"
}

build() {
  sh imod_4.9.10_RHEL7-64_CUDA8.0.sh -extract
  
  cd "IMODtempDir/"
  tar xvzf "imod_${pkgver}_RHEL7-64_CUDA8.0.tar.gz"
}


package() {
  mkdir -p "$pkgdir/opt"
  mkdir -p "$pkgdir/usr/bin/"
  cp -r "$srcdir/IMODtempDir/imod_$pkgver/" "$pkgdir/opt"
  ln -s "/opt/imod_$pkgver" "$pkgdir/opt/IMOD" 
}

# vim:set ts=2 sw=2 et:
