# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>
pkgname=julia-nightly-bin
pkgver=20200701
pkgrel=1
arch=('x86_64')
pkgdesc='High-level, high-performance, dynamic programming language - official nightly binaries'
provides=(julia)
conflicts=(julia julia-git julia-beta-bin julia-bin)
depends=('gmp' 'suitesparse' 'hicolor-icon-theme' 'libssh2')
url='https://julialang.org/'
license=('MIT')
source=($pkgname-$pkgver.tar.gz::"https://julialangnightlies-s3.julialang.org/bin/linux/x64/julia-latest-linux64.tar.gz"
16x16.png::https://github.com/JuliaLang/julia/raw/master/contrib/mac/frameworkapp/JuliaLauncher/Assets.xcassets/AppIcon.appiconset/16.png
32x32.png::https://github.com/JuliaLang/julia/raw/master/contrib/mac/frameworkapp/JuliaLauncher/Assets.xcassets/AppIcon.appiconset/32.png
128x128.png::https://github.com/JuliaLang/julia/raw/master/contrib/mac/frameworkapp/JuliaLauncher/Assets.xcassets/AppIcon.appiconset/128.png
256x256.png::https://github.com/JuliaLang/julia/raw/master/contrib/mac/frameworkapp/JuliaLauncher/Assets.xcassets/AppIcon.appiconset/256.png
512x512.png::https://github.com/JuliaLang/julia/raw/master/contrib/mac/frameworkapp/JuliaLauncher/Assets.xcassets/AppIcon.appiconset/512.png)
sha256sums=('SKIP'
            '85aff59221938dd83aa3808910fb455c64f3f0936604bfaad7b8d27c01e3a7ed'
            '0310782968fe0ba2910e8a4fc3920ab58c0b8f91c66a66f6cff82cd0d6d31612'
            'aab27b427cb21108d831f2d9ddc89ce0948f7e8cb82e4bb2dc1bc82c6676224f'
            '001f5fe2478572c69ddcf135d460fab18fc851723e529b056fd9b9852b47f3a5'
            '3994d4d59d46e2d226d59f372e5b68eb23e8dc074529e870796f1132f5df8a5b')
options=(!strip)

pkgver() {
  date +%Y%m%d
}

package() {
  hash=$(ls -ld $srcdir/* | grep -v tar | tail -n 1 | rev | cut -d '-' -f 1 | rev)
  cd $srcdir/julia-${hash}
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  install -Dm644 LICENSE.md \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
  cp -r {bin,include,lib,share} ${pkgdir}/usr/
  cp -r etc ${pkgdir}
  rm -rf $pkgdir/usr/share/icons/hicolor/scalable
  for i in 16 32 128 256 512
  do
    mkdir -p $pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/
    install -Dm644 $srcdir/${i}x${i}.png $pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/julia.png
  done
}
