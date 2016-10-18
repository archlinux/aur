# Maintainer: Campbell Barton <ideasman42@gmail.com>

_pkgname=maryspeak
_version=git
pkgver=1.0
pkgname=${_pkgname}-${_version}
pkgrel=1
pkgdesc="Command line access to MaryTTS (text to speech) software."
arch=('i686' 'x86_64')

url="https://github.com/ideasman42/${_pkgname}"
license=('GPL')
groups=()
depends=('marytts')
makedepends=('apache-ant')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+${url}.git"
)
noextract=()
md5sums=(
'SKIP'
) #autofill using updpkgsums

build() {
  cd $_pkgname

  cat << EOF > maryspeak
#!/bin/sh
exec java -cp "/opt/marytts/lib/*" -Dmary.base=/opt/marytts maryspeak.Maryspeak "\$@"
EOF
  chmod +x maryspeak

  ant
}

package() {
  mkdir $pkgdir/opt/marytts/lib -p
  mkdir $pkgdir/usr/bin -p
  cp $_pkgname/maryspeak.jar $pkgdir/opt/marytts/lib/
  cp $_pkgname/maryspeak $pkgdir/usr/bin/
}
