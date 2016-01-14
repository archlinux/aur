# Maintainer: Drew Noel <drewmnoel@gmail.com>
pkgname=jpf-core-hg
pkgver=r29.820b89dd6c97
pkgrel=1
pkgdesc=""
arch=('any')
url="http://babelfish.arc.nasa.gov/trac/jpf"
license=('APACHE')
depends=('java-environment-openjdk>=7')
makedepends=('mercurial' 'apache-ant')
optdepends=('apache-ant'
            'junit')
provides=('jpf')
source=('hg+http://babelfish.arc.nasa.gov/hg/jpf/jpf-core'
	'jpf.properties'
        'jpf')

md5sums=('SKIP'
         'e25814db7a0c0efb45ff737a538e49a4'
         '6f96fef6cc825e9823c7daa8fb5d4460')

pkgver() {
  cd $srcdir/jpf-core
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd $srcdir/jpf-core

  # For some reason, this is missing
  mkdir -p lib

  # Compile
  ant build

}

package() {
  # Copy the mandatory config
  install -D -m644 -t $pkgdir/usr/share/java/jpf/ $srcdir/jpf.properties

  # Copy all the .JAR files
  install -D -m644 -t $pkgdir/usr/share/java/jpf/ $srcdir/jpf-core/build/*.jar

  # Copy the jpf executable
  install -D -m755 -t $pkgdir/usr/local/bin/ $srcdir/jpf
}
