# Maintainer: Alad Wenter <nynq@nepuyvahk.vasb> (rot13)
# Contributor: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Chirantan Ekbote <chirantan.ekbote@gmail.com>
# Contributor: Sébastien Luttringer <seblu@aur.archlinux.org>
# Contributor: Tsekhovoy Eugene aka Krash <8552246@gmail.com>

pkgname=mc-git
pkgver=4.8.16.r44.g51d0783
pkgrel=1
pkgdesc='a text based filemanager'
arch=('i686' 'x86_64')
url='http://www.midnight-commander.org/'
license=('GPL')
depends=('e2fsprogs' 'glib2' 'gpm' 'libssh2' 'slang' 'pcre' 'perl' 'aspell')
optdepends=(
    'cabextract: ucab extfs'
    'cdparanoia: audio extfs'
    'cdrkit: iso9660 extfs'
    'gawk: hp48+ extfs'
    'aspell: spelling corrections'
    'cvs: CVS support'
    'mtools: a+ extfs'
    'python2-boto: s3+ extfs'
    'python2-pytz: s3+ extfs'
    'smb: VFS support'
    'unace: uace extfs'
    'unarj: uarj extfs'
    'unrar: urar extfs'
    'zip: uzip extfs'
    'p7zip: support for 7zip archives')
makedepends=('git' 'libxt' 'libx11')
provides=("mc=${pkgver%%.r*}")
conflicts=(mc{,-cvs,-fork-svn,-mp,-slavz,-suse})
backup=('etc/mc/edit.indent.rc'
        'etc/mc/filehighlight.ini'
        'etc/mc/mcedit.menu'
        'etc/mc/mc.ext'
        'etc/mc/mc.keymap'
        'etc/mc/mc.menu'
        'etc/mc/sfs.ini')
options=('!emptydirs')
source=('git+https://github.com/MidnightCommander/mc')
sha256sums=('SKIP')

pkgver() {
  cd mc
  git describe --long | sed -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g'
}

build() {
  export PYTHON=/usr/bin/python2
  cd mc

  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib \
    --sysconfdir=/etc \
    --enable-vfs-smb \
    --with-x \
    --enable-aspell

  make
}

package() {
  cd mc
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 ft=sh et:
