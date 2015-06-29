# Maintainer: epitron <chris@ill-logic.com>
pkgname=svox-pico-bin
pkgver=1.0+git20130326
pkgrel=1
pkgdesc='The text-to-speech engine used on Android phones'
url='https://android.googlesource.com/platform/external/svox/+/master'
license=('custom')
arch=('i686' 'x86_64')

if [[ $CARCH = i686 ]]; then
  _arch=i386

  sha256sums=(
    f6c95bbe61a443a11ae3bf415f0873908994784faa74cf68de53b36bfe67a5ff 
    c761855de47e4e21ec8ddca5ed55dec4690928f0c8bdf1120dfd9af85b5a1335
    6c47e936341b6d2f23d62b29902b7b72dffed02e9d9e9ed2878a61a9611dc698
    a1fa3f1938b6856254d09cf51d7c6344b79cff25c807adf39bb26b141910e492
  )
else
  _arch=amd64

  sha256sums=(
    93384ae527250eb8edba9c48da806c59386214b0769ef1da9b4a6054885eb387
    c761855de47e4e21ec8ddca5ed55dec4690928f0c8bdf1120dfd9af85b5a1335
    767880e8d29e5c84a635b54dc096d78ccfeb32c15e2d41c948eda26cd3702f2b
    a1fa3f1938b6856254d09cf51d7c6344b79cff25c807adf39bb26b141910e492
  )
fi

source=(
  "http://mirrors.kernel.org/ubuntu/pool/multiverse/s/svox/libttspico0_1.0+git20130326-1ubuntu1_${_arch}.deb"
  "http://mirrors.kernel.org/ubuntu/pool/multiverse/s/svox/libttspico-data_1.0+git20130326-1ubuntu1_all.deb"
  "http://mirrors.kernel.org/ubuntu/pool/multiverse/s/svox/libttspico-utils_1.0+git20130326-1ubuntu1_${_arch}.deb"
  "picospeaker"
)

noextract=(
  "libttspico0_1.0+git20130326-1ubuntu1_${_arch}.deb"
  "libttspico-data_1.0+git20130326-1ubuntu1_all.deb"
  "libttspico-utils_1.0+git20130326-1ubuntu1_${_arch}.deb"
)

depends=('popt')
optdepends=('sox: for using the picospeaker script')

# picospeaker source: https://raw.githubusercontent.com/the-kyle/picospeaker/master/picospeaker

package() {
  for deb in "${noextract[@]}"; do
    ar p "$deb" data.tar.gz | tar zx -C "$pkgdir/"
  done

  mv "$pkgdir/usr/lib/"*-linux-gnu/* "$pkgdir/usr/lib"
  rmdir "$pkgdir/usr/lib/"*-linux-gnu

  install -D -m755 picospeaker ${pkgdir}/usr/bin/picospeaker
}
