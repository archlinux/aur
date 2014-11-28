# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=wordforge
pkgver=0.5_rc1
pkgrel=2
pkgdesc="A user friendly translation program (CAT), that makes the translation process simpler."
arch=('i686' 'x86_64')
url="http://translate.sourceforge.net/wiki/wordforge/index"
license=('GPL')
depends=('python' 'pyqt' 'translate-toolkit')
makedepends=('patch')
source=(http://downloads.sourceforge.net/wordforge2/WordForge-0.5-rc1.tar \
        $pkgname.diff)

md5sums=('fcf99c0221a3140aca57d58b677efc73'
         '5c41bdb82236d625b9d3fc151fc1e09f')

build() {
  cd "${srcdir}/WordForge-0.5-rc1"

  patch -Np0 -i "${srcdir}/$pkgname.diff" || return 1

  python setup.py install --root="${pkgdir}" || return 1

#removing files provided by translate-toolkit
  rm "${pkgdir}"/usr/bin/{csv2po,csv2tbx,html2po,lookupclient.py,lookupservice,moz2po,oo2po,oo2xliff,po2csv,po2html,po2moz,po2oo,po2prop,po2tmx,po2ts,po2txt,po2xliff,poclean,pocompile,poconflicts,pocount,podebug,pofilter,pogrep,pomerge,porestructure,poswap,pot2po,prop2po,ts2po,txt2po,xliff2oo,xliff2po} || return 1

#directory for dictionaries writable to all - if you wish
#  chmod 777 "${pgkdir}/usr/lib/python2.6/site-packages/WordForge/Editor/dict"  || return 1
}
