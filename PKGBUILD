# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

set -u
pkgname='bashdb'
#_ver='4.4-0.94'
#_ver='4.4-1.0.1'
_ver='5.0-1.1.0'
pkgver="${_ver//-/_}"
pkgrel='1'
pkgdesc='A debugger for Bash scripts loosely modeled on the gdb command syntax'
arch=('any')
url='http://bashdb.sourceforge.net/'
license=('GPL')
depends=("bash>=${_ver%%-*}" 'python-pygments' 'pygmentize')
_srcdir="${pkgname}-${_ver}"
_verwatch=("https://sourceforge.net/projects/${pkgname}/rss" "\s*<title>.*/${pkgname}-\([_0-9\.]\+\)\.tar\.gz\].*" 'f'); _getlinks() { sed -e '/^\s\+<title>/ s:\([0-9]\)-:\1_:g'; }
source=("https://phoenixnap.dl.sourceforge.net/project/${pkgname}/${pkgname}/${_ver}/${pkgname}-${_ver}.tar.bz2")
md5sums=('2e15192cbb0d41dda9801a6d67aba5f3')
sha256sums=('10a520984b50720e0ece686549f26333ae47fe7c54f79c084c96c1ef73dd1e3d')
sha512sums=('8f1e0db78c054fec2f58b719793bd1d06a4ef31f8d20334c2169989652a2180ed5e1f1a4df189f15cffe06207a63bbce92c4dc029eb843f377a3ee5330380023')

prepare() {
  set -u
  cd "${_srcdir}"
  #sed -e "/^\s\+'4.4' / s:): | '5.0'&:g" -i 'configure'
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
