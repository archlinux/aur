# Maintainer: Que Quotion ( quequotion at g mail dot com )

pkgname=makepkg-optimize
pkgver=1
pkgrel=4
pkgdesc='Additional package optimization routines for makepkg'
arch=('x86_64')
license=('GPL')
url='https://projects.archlinux.org/pacman.git/'
depends=('pacman' 'upx' 'optipng' 'nodejs-svgo')
makedepends=('pacman')
source=('00.optipng.patch' '01.upx.patch' '02.lto.patch' '03.pgo.patch' '04.graphite.patch' '05.svgo.patch'
        'upx.sh' 'optipng.sh' 'svgo.sh'
        'opticonf.patch' 'conf.buildopts.patch' 'conf.pkgopts.patch'
        'makepkg' 'makepkg.conf')
sha512sums=('67fb9359cd5dc52413ad2ca7e91b445826d7cf6b7ad3db0d2b3845310ab0bdfc41c2e70cec564e26269521ac313f7202c44996a24266380e48e88927bd1012e2'
            'b4896082fd7fc4a69abc5fc98bf22c92a94cef9ccae5d3e5d1825cd3f04dcff1bce622a3f7fdc00bd43b5e1d091825d119b3a91d354f1ab58e6a8fe3af72b0e2'
            'bbd4bf3ddbda97008764c1a619aee4f2e3d3476c8affaac75ffee328db452f587454f16158942ec666e2357474a052019e5641ce6d432c43593b3612bdc40af2'
            '5a8083ea14a6a414051602740d1cabf80e77119570b8555194bd921c46a4fce5a7e6611d04a778bfe688e30b0de5ccd6c458299d279476e4ffcc01577959d949'
            '3520817c16ea83a4bed28f153138608456267eac0caed250f8d951c54cf6a07d07e5b13768c5165a8e31a56e76919b3c9b84ad3b2905489ce65e625fa067f9b0'
            'c2f74ab15214ccac6ae570fa4a4ebfdf35690be60851be9eb8ab65c1ce4ebed0f0d3cb98947fd4a586d19cb399d312390ebbc68f4de86f607adef2a2d590798e'
            'db55e9d4302035447854ec34d44d454a1a68882437129c00de388f56413cff71e133848df5a09962c40f2bd0203f5e5c692af4e100e67072da4b504ef4752ca4'
            '60ca209609ddbf617e63c7103d675da17671efc91db066a1e11dd1df78f9c8abf267f1cd417ff3b5db59411cf6e7df134e6bd8b06c73442410f14c13b1f5dd53'
            '9fab754ef2ffb2587d2d9f4669ad12b98393d5df6aff65fb15ff93e0dbb4912a65c0f76e26ef1a4a36e55f4e74a02367a7795812353b8c85ad1099cd333c86a7'
            '16c2b0e666234f1a493e7456f4c387fbabd24b10514c93fa4338520e8f537e9a12de0d833a6148fe871452d87f6e1b3454b2bde332b9ba4c4e7680616b7eeede'
            'dd609146c46b36bf3b9d7ed81935b64708cc5a37210f39e54162c603f1cae2bc9d8110dec92d61939c63245549b0a4548b17a15f9746abdd64faa65421288a2e'
            'b35f66b48912b1904c54205ea70e83a526790bb6e1424c4a2a4f11637f41fe6800effeb179284a3c73031fe2496ab5245e39e31d7e2eb400287b531d0ba89c97'
            '6df2ac2133f72ac2f3533fa9e3cc9337849dd5afbba2fd66b5d4d8b0b65a892c04771ceb6407eac357755fef87ac940d7848ccad915c387e465ad46b1ed496a3'
            '1a147b4fdeaed571d6714af5443649e1f92512ef12bf3f66f77a13aa221318eff959f3c2fcbab4cb4196ebbf4ce33f8e6998f9bde0131b3c3b8a53f367dda31f')

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
  patch -Np0 < ../05.svgo.patch
}

package() {
  cd $pkgname
  mkdir -p $pkgdir/usr/{bin,share/makepkg/tidy}/
  install -m755 makepkg-optimize $pkgdir/usr/bin/
  #Uncomment once dropped from pacman.
  #install -m755 ../optipng.sh $pkgdir/usr/share/makepkg/tidy/optipng.sh
  #install -m755 ../upx.sh $pkgdir/usr/share/makepkg/tidy/upx.sh
  #install -m755 ../upx.sh $pkgdir/usr/share/makepkg/tidy/svgo.sh
  mkdir -p $pkgdir/etc/
  install -m644 makepkg-optimize.conf $pkgdir/etc/
}
