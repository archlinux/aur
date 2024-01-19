# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: neeshy <neeshy@tfwno.gf>

pkgname=ripme-bin
pkgver=2.1.8
_pkgver=${pkgver}-29-b080faae
pkgrel=1
pkgdesc="Downloads albums in bulk"
arch=('any')
url="https://github.com/ripmeapp2/ripme"
license=('MIT')
depends=('java-runtime>=20' 'bash')
provides=('ripme')
conflicts=('ripme')
source=("https://github.com/ripmeapp2/ripme/releases/download/${pkgver}/ripme-${pkgver}.jar"
        "https://raw.githubusercontent.com/ripmeapp2/ripme/2.1.8/LICENSE.txt")
sha256sums=('4f3e8b7abe898a788934743d778bcca8cb767ee22d21fb8492852d00a3c29dee'
            'f17abb5fb22a7dd6408518207f0f8e301322153585d9ad08941a0d498d7c4f9a')

package() {
  cd "${srcdir}"
  install -Dm644 "ripme-${pkgver}.jar" "${pkgdir}/usr/share/java/ripme.jar"
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cat <<EOF | install -Dm755 /dev/stdin "${pkgdir}/usr/bin/ripme"
#!/bin/sh
exec java -jar /usr/share/java/ripme.jar "\$@"
EOF
}
