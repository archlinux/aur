# Maintainer: Phillip Smith <pkgbuild@phs.id.au>
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

pkgname=fina
pkgver=0.3.1
pkgrel=1
pkgdesc="A simple, robust shell script that loads iptables rules from a rules directory."
arch=(any)
url="http://www.schwarzvogel.de/software-$pkgname.shtml"
license=('GPLv2')
source=("http://www.schwarzvogel.de/pkgs/$pkgname-$pkgver.tar.gz"
        'systemd.fina'
        'systemd.fina6'
        'flush-iptables.sh'
        'flush-ip6tables.sh')
md5sums=('651306bdcfcb10eadce78de9a221abbf'
         'a286f87648a0f84ac448cbfffcd53faf'
         '184204d4e357f90d332a69a60e63f752'
         'faa4d6181f1b109c0e4e2dbf5faa9408'
         'd0a12e11a4252f8a7b5a43580c24ea71')

package() {
  cd "$srcdir"/$pkgname-$pkgver

  # Install main program script
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname

  # install flush-iptables
  install -Dm755 "$srcdir"/flush-iptables.sh "$pkgdir"/usr/bin/flush-iptables
  install -Dm755 "$srcdir"/flush-ip6tables.sh "$pkgdir"/usr/bin/flush-ip6tables

  # Install configuration file
  install -dm755 "$pkgdir"/etc/$pkgname/rules.d/examples.d
  install -m600 $pkgname.cfg "$pkgdir"/etc/$pkgname/$pkgname.cfg
  chmod -R o=rwX,go= "$pkgdir"/etc/$pkgname

  # Install example rules
  cp -r example-rules.d/* "$pkgdir"/etc/$pkgname/rules.d/examples.d/

  # install systemd unit files
  install -D -m755 "$srcdir"/systemd.fina "$pkgdir"/usr/lib/systemd/system/fina.service
  install -D -m755 "$srcdir"/systemd.fina6 "$pkgdir"/usr/lib/systemd/system/fina6.service
}

# vim:set ts=2 sw=2 et:
