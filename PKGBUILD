# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Tomasz Zok <tomasz.zok [at] gmail.com>

set -u
pkgname='undbx'
pkgver='0.21'
pkgrel='1'
pkgdesc='Tool to extract, recover and undelete e-mail messages from Outlook Express .dbx files'
arch=('i686' 'x86_64')
#url='http://code.google.com/p/undbx/'
url='https://sourceforge.net/projects/undbx/'
license=('GPLv3')
_srcdir="${pkgname}-${pkgver}"
#source=("http://undbx.googlecode.com/files/undbx-${pkgver}.tar.gz")
source=("http://iweb.dl.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('5d81c36ef3ef918e6ff904fbfd8a900e')
sha256sums=('d29b0b9890eed965f8b84ce139579a87b960dc8de22a7fbba236d90c7f0b9a59')

prepare() {
  set -u
  cd "${_srcdir}"
  sed -e 's:-Werror::g' -i 'Makefile.in'
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  if [ ! -s 'Makefile' ]; then
    ./configure --prefix='/usr'
  fi
  make -s -j1 # Too small for threaded make
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make -j1 DESTDIR="${pkgdir}" install
  set +u
}
set +u
