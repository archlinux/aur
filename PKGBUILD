# Maintainer: Your Name <your.email@example.com>
pkgname=origami-waves
pkgver=1.19
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
sha256sums=('2d560220d599888594647c5a8cc49499a596e6be6612fde89bdef72e880606da')

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
