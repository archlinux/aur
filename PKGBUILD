# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

set -u
pkgname='bashdb'
#_ver='4.4-0.94'
_ver='4.4-1.0.1'
pkgver="${_ver//-/_}"
pkgrel='1'
pkgdesc='A debugger for Bash scripts loosely modeled on the gdb command syntax'
arch=('any')
url='https://bashdb.sourceforge.net/'
license=('GPL')
depends=('bash' 'python-pygments' 'pygmentize')
_srcdir="${pkgname}-${_ver}"
source=("https://downloads.sourceforge.net/${pkgname}/${pkgname}-${_ver}.tar.bz2")
md5sums=('0cf622eb97218a2ae52bcac5c9d5e219')
sha256sums=('bf603b6ee1f60c10861dcb1fef73a10f924327b5ff05cf41e2290f3edc1e6284')
sha512sums=('306fc5a49490fe04828cd6c64b23302e0f48ba8558780c93d45d9c615206e91dac5d8ff3d0660e50bc3204873131d1296492bccc23119d2f58c990bd3603221c')

prepare() {
  set -u
  cd "${_srcdir}"
  sed -e "/^\s\+'4.4' / s:): | '5.0'&:g" -i 'configure'
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  if [ ! -s 'Makefile' ]; then
    ./configure --prefix='/usr' --disable-static -C
  fi
  make -s
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make -s -j1 DESTDIR="${pkgdir}" install
  rm -f "${pkgdir}/usr/share/info/dir"
  set +u
}
set +u
