pkgname=pmcl-bin
realver=3.6.dev-24646f9
pkgver=3.6.dev_24646f9
pkgrel=2
pkgdesc='Play! Minecraft Launcher: A free Minecraft JE Launcher'
url='https://pmcl.fun'
arch=('any')
license=('GPL-3.0')
depends=('jre14-openjdk')
source=("https://github.com/xqzi/PMCL/releases/download/latest/PMCL-$realver.jar")
#noextract=('*')

build () {
  cd "$srcdir"
  rm -rf ./*
  mv ../PMCL-$realver.jar .
  mkdir -p usr/share/pmcl
  mkdir -p usr/libexec
  mkdir -p usr/bin
  cat > usr/bin/pmcl << EOF
exec /usr/libexec/startPMCL
EOF
  cat > usr/libexec/startPMCL << EOF
exec java -jar /usr/share/pmcl/PMCL-$realver.jar
EOF
  mv PMCL-$realver.jar usr/share/pmcl
}

package () {
  mv "$srcdir"/* "$pkgdir"
  cd "$pkgdir"
  chmod +x usr/libexec/startPMCL
  chmod +x usr/bin/pmcl
}
