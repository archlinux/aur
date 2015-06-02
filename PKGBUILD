# Maintainer: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# http://github.com/fukawi2/aur-packages

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=massh
pkgver=2.0.57
pkgrel=1
pkgdesc="Mass ssh'er that allows for parallel execution of commands on remote systems"
arch=('any')
url="http://m.a.tt/er/massh.html"
license=('GPL3')
depends=('openssh')
source=("http://m.a.tt/er/$pkgname.tgz"
        'fix-paths.patch')
md5sums=('57585bb5328baf2e5ef8588815287ebe'
         '5990a49e673c0fda73a446bb7e562ddd')

# these are lifted directly from the upstream install script
MyNameIs=$pkgname
Group=root
BinDir="/usr/bin"
EtcDir="/etc/${MyNameIs}"
LibDir="/usr/lib/${MyNameIs}"
VarDir="/var/${MyNameIs}"
ManDir="/usr/share/man/man1"

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # these install commands are lifted from the upstream install script too
  # we insert the relevent $srcdir and $pkgdir vars of course.
  install -v -o root -g ${Group} -m 755 -d "$pkgdir"/${BinDir}
  install -v -o root -g ${Group} -m 755 -d "$pkgdir"/${EtcDir}
  install -v -o root -g ${Group} -m 755 -d "$pkgdir"/${LibDir}
  install -v -o root -g ${Group} -m 755 -d "$pkgdir"/${ManDir}
  install -v -o root -g ${Group} -m 755 -d "$pkgdir"/${VarDir}/hosts
  install -v -o root -g ${Group} -m 755 "$srcdir/$pkgname-$pkgver"${BinDir}/${MyNameIs} \
                                        "$pkgdir"/${BinDir}/${MyNameIs}
  install -v -o root -g ${Group} -m 755 "$srcdir/$pkgname-$pkgver"${BinDir}/${MyNameIs}filesupdate \
                                        "$pkgdir"/${BinDir}/${MyNameIs}filesupdate
  install -v -o root -g ${Group} -m 755 "$srcdir/$pkgname-$pkgver"${EtcDir}/${MyNameIs}.conf \
                                        "$pkgdir"/${EtcDir}/${MyNameIs}.conf
  install -v -o root -g ${Group} -m 755 "$srcdir/$pkgname-$pkgver"${LibDir}/lib${MyNameIs}.sh \
                                        "$pkgdir"/${LibDir}/lib${MyNameIs}.sh
  install -v -o root -g ${Group} -m 755 "$srcdir/$pkgname-$pkgver"${ManDir}/${MyNameIs}.1.gz \
                                        "$pkgdir"/${ManDir}/${MyNameIs}.1.gz

  # Create some example files
  cat > $pkgdir/var/$pkgname/script.time << EOT
#!/bin/bash

# Name: time
# Author: Michael Marschall
# Modified: 2008.04.25

# I use this to check massh's script pushing and executing.
date +%Y%m%d%H%M > time.txt
date +%Y%m%d%H%M
EOT
  chmod 755 $pkgdir/var/$pkgname/script.time

  cat > $pkgdir/var/$pkgname/hosts.all << EOT
db1.mydomain.com
db2.mydomain.com
web[1..4].mydomain.com
gateway.google.com
203.45.133.[10..19]
EOT

  cat > $pkgdir/var/$pkgname/file.motd << EOT
You are logged into a machine managed by maash
$url
EOT
}

# vim:set ts=2 sw=2 et:
