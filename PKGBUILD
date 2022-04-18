# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: Florian Léger <florian6 dot leger at laposte dot net>

set -u
pkgname='jwasm'
#_pkgname='JWasm211as'
pkgver='2.15'
pkgrel='1'
pkgdesc='a free MASM-compatible assembler'
arch=('i686' 'x86_64')
#url='http://www.japheth.de/JWasm.html'
#url='https://sourceforge.net/projects/jwasm/files/JWasm%20Source%20Code/'
#url='https://github.com/JWasm/JWasm'
url='https://github.com/Baron-von-Riedesel/JWasm'
license=('custom')
depends=('glibc')
#_verwatch=('https://sourceforge.net/projects/jwasm/files/JWasm%20Source%20Code/' '\s\+JWasm\(.*\)\.zip.*' 'f')
#_verwatch=("${url}/releases.atom" '\s\+<link rel="alternate" type="text/html" href=".*/'"${url##*/}"'/releases/tag/v*\([^"]\+\)"/>.*' 'f') # RSS
_srcdir="${url##*/}-${pkgver}"
source=("${_srcdir}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('44571062dc7a2dc7f121291a0a4aa263')
sha256sums=('47cfc392ec379472374f0e14f2c804f929fd6e712aae7679a445c75a17b7a6f9')

build() {
  set -u
  cd "${_srcdir}"
  nice make -f 'GccUnix.mak' -s
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  install -Dpm755 'build/GccUnixR/jwasm' -t "${pkgdir}/usr/bin/"
  install -Dpm644 'History.txt' -t "${pkgdir}/usr/share/doc/jwasm/"
  install -Dpm644 'Html/License.html' -t "${pkgdir}/usr/share/licenses/jwasm/"
  set +u
}
set +u
