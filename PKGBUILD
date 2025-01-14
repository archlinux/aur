# Maintainer: Your Name <your.email@example.com>
pkgname=origami-waves
pkgver=1.16
pkgrel=1
pkgdesc="Origami Waves: translate your pptx using ollama"
#arch=('x86_64')
arch=('any')
url="https://github.com/hellonico/ocean-waves"
license=('MIT')
depends=('jdk-openjdk>=21')
#makedepends=('clojure' 'deps-edn')
#source=("https://github.com/yourusername/my-clojure-project/releases/download/v${pkgver}/my-clojure-project-${pkgver}.jar")
source=("https://repository.hellonico.info/repository/hellonico/origami/wave/${pkgver}/wave-${pkgver}.jar")
sha256sums=('35e07a51950492080ee9dec8fd680d6d5dc756db616e28d061b3a795947cbeee')

build() {
  echo "No additional build step required. Uberjar provided."
}

package() {
  # Install the jar
  install -Dm644 "${srcdir}/wave-${pkgver}.jar" "${pkgdir}/usr/share/${pkgname}/${pkgname}.jar"

  # Create a script to run the jar
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" << EOF
#!/bin/bash
exec java -jar /usr/share/${pkgname}/${pkgname}.jar "\$@"
EOF

  # Optional: Install documentation
  # install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
