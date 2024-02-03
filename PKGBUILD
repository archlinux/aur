# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: Florian Léger <florian6 dot leger at laposte dot net>

set -u
pkgname='jwasm'
#_pkgname='JWasm211as'
pkgver='2.17'
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
md5sums=('3d29d8a4fa56bd1f3971f3949cb187eb')
sha256sums=('dad51777ddb2b816bfdefbb73c016c3e34fc976c3e3f6df49ec4b17ab7cc93e3')

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
