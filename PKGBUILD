# Contributor: Sorin Ionescu <sorin.ionescu@gmail.com>
pkgname=link-backup
pkgver=0.8
pkgrel=5
pkgdesc="Intelligent backup utility that handles renames, moves, duplicate files"
arch=('i686' 'x86_64')
depends=('python' 'openssh' 'rsync')
url="http://www.scottlu.com/Content/Link-Backup.html"
license=('unknown')
install=link-backup.install
source=(http://www.scottlu.com/files/lb.py
        lb.cron
        lb.exclude
        shebang.patch
        exclude.patch
        root-src-fix.patch)

md5sums=('4acd3ea00da33ef14a87410cfcc7c987'
         '79b92199173c8895f828b9839c88ce62'
         '67548d6c7e00a8dab1c562e7735b93f9'
         '8fd3cc50efd4d83db0220ad3c5f4cbac'
         'b2ed3a9cb520e52a18ca37d8d7558557'
         '21b1e3f881038f173efcde1fa432d6ec')

build()
{
  cd $startdir/src
  patch -p0 -i $startdir/src/shebang.patch || return 1
  patch -p0 -i $startdir/src/exclude.patch || return 1
  patch -p0 -i $startdir/src/root-src-fix.patch || return 1
  install -D -m 755 lb.py $startdir/pkg/usr/bin/lb || return 1
  install -D -m 755 lb.cron $startdir/pkg/usr/share/lb/lb.cron || return 1
  install -D -m 644 lb.exclude $startdir/pkg/usr/share/lb/lb.exclude || return 1
}

# vim:set ts=2 sw=2 et:
