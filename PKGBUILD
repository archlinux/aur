# Maintainer: Bilal ELmoussaoui <bil.elmoussaoui@gmail.com>

pkgname=temps
_pkgbase=Temps
pkgrel=1
pkgver=0.7.0
_pkgver="v$pkgver"
pkgdesc="Simple menubar application based on Electron with actual weather information and forecast"
url="https://github.com/jackd248/temps"
provides=('temps')
arch=('i686' 'x86_64' 'arm7l')
license=('MIT')
makedepends=('unzip')
backup=()
install=''
source=(
    "${_pkgbase}.desktop"
    "${_pkgbase}.png"
)
source_i686+=("${url}/releases/download/${_pkgver}/${_pkgbase}-linux-ia32.zip")
source_x86_64+=("${url}/releases/download/${_pkgver}/${_pkgbase}-linux-x64.zip")
soruce_armv7l+=("${url}/releases/download/${_pkgver}/${_pkgbase}-linux-armv7l.zip")
sha256sums_x86_64=('6252c1d76336e752882e29e85cf2fd51cf06148de3e479f8102a261e1eedd182')
sha256sums_i686=('5f67ba08d713499aec4025ac9f00fd434e53cbe7d1f8b315487b181de269d92e')
sha256sums_armv7l=('d318fddcf78d91121baedbdd9f98b9f2cc9e02f799f4fa07050b85fd97a8041a')
sha256sums=(
        '0a14c60b053eff6d6342a71e472d0b3cac4468ff11285778404e05d52aa7ed59'
        '93228edce78347773d41a0fc4159f13b802b686d5b3807644868a44cc179ec83'
        )

package() {
    install -d "$pkgdir"/opt
    case "$CARCH" in
      armv7l)
        cp -R "$srcdir"/Temps-linux-arm7l "$pkgdir"/opt/Temps
        ;;
      i686)
        cp -R "$srcdir"/Temps-linux-ia32 "$pkgdir"/opt/Temps
        ;;
      x86_64)
        cp -R "$srcdir"/Temps-linux-x64 "$pkgdir"/opt/Temps
        ;;
    esac
    install -d "$pkgdir"/usr/bin
    ln -sf ../../opt/Temps/Temps "$pkgdir"/usr/bin/Temps

    install -D -m644 "./${_pkgbase}.desktop" "${pkgdir}/usr/share/applications/${_pkgbase}.desktop"
    install -D -m644 "./${_pkgbase}.png" "${pkgdir}/usr/share/pixmaps/${_pkgbase}.png"
}
