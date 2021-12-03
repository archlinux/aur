# Maintainer :  Kr1ss  $(tr +- .@ <<<'<kr1ss+x-yandex+com>')


pkgname=gospider-bin
_name="${pkgname%-bin}"

pkgver=1.1.6
pkgrel=1

pkgdesc='Fast web spider written in Go'
arch=('x86_64' 'i686' 'arm' 'aarch64')
url="https://github.com/jaeles-project/$_name"
license=('MIT')

provides=("$_name")
conflicts=("$_name")

source_i686=("$url/releases/download/v$pkgver/${_name}_v${pkgver}_linux_i386.zip")
source_x86_64=("$url/releases/download/v$pkgver/${_name}_v${pkgver}_linux_x86_64.zip")
source_arm=("$url/releases/download/v$pkgver/${_name}_v${pkgver}_linux_arm.zip")
source_aarch64=("$url/releases/download/v$pkgver/${_name}_v${pkgver}_linux_arm64.zip")
sha256sums_x86_64=('41bdd76aff8d063655dc473f035ca7659f8549fbf264be5185f50d288666f93d')
sha256sums_i686=('d0c87efbda2aa9d0b6f1dfeec890a914a035dbf6d2aa8245de8a7fe23cf5871f')
sha256sums_arm=('3f73275689b28b24f2f139225423a3f263c1e11f910b4151b34fe7f41ceb49ad')
sha256sums_aarch64=('39b78dc7deb2fb3e271aded05b6d7e47a395cd743f07bfdbfc0ee5083ba30b0e')

options=('!strip')  # upstream's binary is already stripped


package() {
  case $CARCH in
    i686)     _ARCH=i386;;
    aarch64)  _ARCH=arm64;;
    *)        _ARCH=$CARCH
  esac
  cd "${_name}_v${pkgver}_linux_$_ARCH"
  install -Dm755 "$_name"  -t"$pkgdir/usr/bin/"
  install -Dm644 README.md -t"$pkgdir/usr/share/doc/$_name/"
  install -Dm644 LICENSE   -t"$pkgdir/usr/share/licenses/$_name/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
