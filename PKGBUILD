# Contributor: flu
# Contributor: IgnorantGuru http://igurublog.wordpress.com/contact-ignorantguru/

pkgname=udevil-git
pkgver=20150504.216
pkgrel=1
pkgdesc='Mount without password'
arch=('i686' 'x86_64')
url=http://ignorantguru.github.com/udevil
license=('GPL3')
makedepends=('intltool' 'gettext')
depends=('udev' 'glib2')
optdepends=(
  'nfs-utils:  mount nfs shares'
  'sshfs:      mount sftp shares'
  'curlftpfs:  mount ftp shares'
  'cifs-utils: mount samba shares'
  'davfs2:     mount WebDAV shares'
  'eject:      eject via devmon'
  'spacefm:    devmon popups'
  'zenity:     devmon popups'
  'pmount:     devmon mount without suid udevil'
  'udisks:     devmon mount without suid udevil'
  'udisks2:    devmon mount without suid udevil'
)
conflicts=('udevil' 'devmon' 'devmon-git')
provides=('udevil' 'devmon')
backup=('etc/udevil/udevil.conf' 'etc/conf.d/devmon')
options=(!strip debug)
source=(git://github.com/IgnorantGuru/udevil.git)
md5sums=(SKIP)

pkgver() {
  cd udevil
  printf "$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count master)"
}

build() {
  cd udevil
  ./configure --prefix=/usr
  make
}

package() {
  cd udevil
  make DESTDIR="$pkgdir/" install
}
