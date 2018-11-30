# Maintainer: Martynas Mickevičius <self at 2m dot lt>
_version=1.1.0-M8

pkgname=coursier
pkgver="${_version/-/_}"
pkgrel=1
pkgdesc="Pure Scala Artifact Fetching"
arch=('any')
url="http://get-coursier.io"
license=('Apache')
depends=('java-runtime-headless>=8' 'bash')

source=("https://github.com/coursier/coursier/raw/v${_version}/coursier")
sha256sums=('6c7be5eaab67a80fcb40473633650aa982360e94ee1834666b11c2f052612545')
noextract=('coursier')

build() {
  cd "${srcdir}"
  mkdir -p cache bin
  export COURSIER_CACHE="${srcdir}/cache"
  sh ./coursier bootstrap \
    --intransitive "io.get-coursier::coursier-cli:${_version}" \
    --classifier standalone \
    -A jar \
    -J "-noverify" \
    --no-default \
    -r central \
    -r sonatype:releases \
    -f -o "bin/coursier" \
    -s
}

package() {
  install -D -m755 "${srcdir}/bin/coursier" "${pkgdir}/usr/bin/coursier"
}
