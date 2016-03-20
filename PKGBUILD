# Maintainer: Que Quotion ( quequotion at g mail dot com )

pkgname=makepkg-optimize
pkgver=1
pkgrel=3
pkgdesc='Additional package optimization routines for makepkg'
arch=('x86_64')
license=('GPL')
url='https://projects.archlinux.org/pacman.git/'
depends=('pacman' 'upx' 'optipng')
makedepends=('pacman')
source=('00.optipng.patch' '01.upx.patch' '02.lto.patch' '03.pgo.patch' '04.graphite.patch'
        'upx.sh' 'optipng.sh'
        'opticonf.patch' 'conf.buildopts.patch' 'conf.pkgopts.patch'
        'makepkg' 'makepkg.conf')
sha512sums=('67fb9359cd5dc52413ad2ca7e91b445826d7cf6b7ad3db0d2b3845310ab0bdfc41c2e70cec564e26269521ac313f7202c44996a24266380e48e88927bd1012e2'
            'b4896082fd7fc4a69abc5fc98bf22c92a94cef9ccae5d3e5d1825cd3f04dcff1bce622a3f7fdc00bd43b5e1d091825d119b3a91d354f1ab58e6a8fe3af72b0e2'
            'fde847c42dc992f741fa9a9887d2dad426d175198c5a8ab9ca112219e79e1e450502a2c422fba5ac3237cb851b8af1cd6f30dac8fb46d7e625bd0e8254475af5'
            'a7ecf53268458d4579c629ea03aa42664de4cc1b91aff560c7587f0ebe5cd954a1bd9beb2290919d7068017e4e9675af5528cb24a29a6c043d0aec0a90e2efd8'
            '7c54d9c425ec6b6baf8ff4cd1580c6235fe01a612959bc5ae86eafaf9923e45039b8c303e2fcea113b65183ffd00fa06caf5e578f7fab146e02da3e926423e54'
            'db55e9d4302035447854ec34d44d454a1a68882437129c00de388f56413cff71e133848df5a09962c40f2bd0203f5e5c692af4e100e67072da4b504ef4752ca4'
            '60ca209609ddbf617e63c7103d675da17671efc91db066a1e11dd1df78f9c8abf267f1cd417ff3b5db59411cf6e7df134e6bd8b06c73442410f14c13b1f5dd53'
            '16c2b0e666234f1a493e7456f4c387fbabd24b10514c93fa4338520e8f537e9a12de0d833a6148fe871452d87f6e1b3454b2bde332b9ba4c4e7680616b7eeede'
            'dd609146c46b36bf3b9d7ed81935b64708cc5a37210f39e54162c603f1cae2bc9d8110dec92d61939c63245549b0a4548b17a15f9746abdd64faa65421288a2e'
            'cef2f8f3e82fa668c490f305bb01a344391958ca3f0be95da09e6008b30ecf996803dfda863a73e340c71937c7691d115bfe7e109c71d71eb65b5052bb179504'
            '6df2ac2133f72ac2f3533fa9e3cc9337849dd5afbba2fd66b5d4d8b0b65a892c04771ceb6407eac357755fef87ac940d7848ccad915c387e465ad46b1ed496a3'
            '5f89de376c1ce101f1bdd99eb15c611cb2f3e75d53c30962ff76946222594cdcbf543cc14819088fbc0dc00f8d0a32c227c7657c0b225548d3bcbdd1f874f189')

prepare() {
  # Use the user's currently installed versions of both
  #cp /usr/bin/makepkg ./makepkg-optimize
  #cp /etc/makepkg.conf ./makepkg-optimize.conf

  # Replace with above after pacman update
  mkdir $pkgname
  cd $pkgname
  cp ../makepkg makepkg-optimize
  cp ../makepkg.conf makepkg-optimize.conf

  # Separate config file
  patch -Np0 < ../opticonf.patch
  patch -Np0 < ../conf.buildopts.patch
  patch -Np0 < ../conf.pkgopts.patch

  # Add features in series
  patch -Np0 < ../00.optipng.patch
  patch -Np0 < ../01.upx.patch
  patch -Np0 < ../02.lto.patch
  patch -Np0 < ../03.pgo.patch
  patch -Np0 < ../04.graphite.patch
}

package() {
  cd $pkgname
  mkdir -p $pkgdir/usr/{bin,share/makepkg/tidy}/
  install -m755 makepkg-optimize $pkgdir/usr/bin/
  #Uncomment once dropped from pacman.
  #install -m755 ../optipng.sh $pkgdir/usr/share/makepkg/tidy/optipng.sh
  #install -m755 ../upx.sh $pkgdir/usr/share/makepkg/tidy/upx.sh
  mkdir -p $pkgdir/etc/
  install -m644 makepkg-optimize.conf $pkgdir/etc/
}
