# Maintainer: Hajos Attila <linux[dot]alucard[at]gmail[dot]com>
# Contributor: flu
# Contributor: IgnorantGuru http://igurublog.wordpress.com/contact-ignorantguru/

pkgname=udevil-git
pkgver=20200402.230
pkgrel=1
pkgdesc="Mount without password"
arch=('i686' 'x86_64')
url="https://github.com/alpharde/udevil"
license=('GPL3')
makedepends=('intltool' 'gettext')
depends=('udev' 'glib2')
optdepends=(
    'nfs-utils:  mount nfs shares'
    'sshfs:      mount sftp shares'
    'curlftpfs:  mount ftp shares'
    'cifs-utils: mount samba shares'
    'davfs2:     mount WebDAV shares'
    'spacefm:    devmon popups'
    'zenity:     devmon popups'
    'pmount:     devmon mount without suid udevil'
    'udisks2:    devmon mount without suid udevil'
)
conflicts=('udevil' 'devmon' 'devmon-git')
provides=('udevil' 'devmon')
backup=('etc/udevil/udevil.conf' 'etc/conf.d/devmon')
options=(!strip debug)
source=("git+${url}.git")
md5sums=(SKIP)

pkgver() {
  cd udevil
  printf "$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count HEAD)"
}

build() {
    sed -i -e "s/finalize(/finalize(int sig/" udevil/src/udevil.c
    sed -i -e "s/interrupt(/interrupt(int sig/" udevil/src/udevil.c
    cd udevil
    ./configure --prefix=/usr
    make
}

package() {
    cd udevil
    make DESTDIR="$pkgdir/" install
}
