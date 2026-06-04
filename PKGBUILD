# Maintainer: maoyaotang <maoyaotang@163.com>

pkgname=android-signapk-git
pkgver=1.0.3.r2.gf4dc646
pkgrel=1
pkgdesc="Arch系统 AOSP signapk 支持 -w --min-sdk-version --disable-v2等签名工具"
arch=('any')
url="https://github.com/maoyaotang12/android-signapk"
license=('MIT')
depends=('java-runtime'
'bcpkix-git'
'bcprov-git')
conflicts=(
    "${pkgname%-git}"
)

source=(
  git+${url}.git)

sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^[^0-9]*//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -d "$pkgdir/usr/share/java/$pkgname"
  install -d "$pkgdir/usr/bin"
  install -m644 *.jar "$pkgdir/usr/share/java/$pkgname/"
  install -Dm755 apksigner.sh "$pkgdir/usr/share/java/$pkgname/apksigner.sh"
  ln -s "/usr/share/java/$pkgname/apksig.jar" "$pkgdir/usr/share/java/apksig.jar"
  ln -s "/usr/share/java/$pkgname/conscrypt-openjdk-2.6-SNAPSHOT-linux-x86_64.jar" "$pkgdir/usr/share/java/conscrypt.jar"
  ln -s "/usr/share/java/$pkgname/signapk.jar" "$pkgdir/usr/share/java/signapk.jar"
  ln -s "/usr/share/java/$pkgname/apksigner.sh" "$pkgdir/usr/share/java/signapk"
  ln -s "/usr/share/java/signapk" "$pkgdir/usr/bin/signapk"
}
