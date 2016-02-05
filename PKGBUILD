# Maintainer: kusanaginoturugi <kusanaginoturugi at gmail dot com>
pkgname=man-pages-systemd-ja
pkgver=1
pkgrel=1
pkgdesc="Japanese man pages for the Systemd"
arch=("any")
url="https://sites.google.com/site/kandamotohiro/systemd?pli=1"
license=("LGPL2.1")
source=("https://sites.google.com/site/kandamotohiro/systemd/journalctl.1?attredirects=0&d=1"
        "https://sites.google.com/site/kandamotohiro/systemd/journald.conf.5?attredirects=0&d=1"
        "https://sites.google.com/site/kandamotohiro/systemd/systemctl.1?attredirects=0&d=1"
        "https://sites.google.com/site/kandamotohiro/systemd/systemd.1?attredirects=0&d=1"
        "https://sites.google.com/site/kandamotohiro/systemd/systemd.unit.5?attredirects=0&d=1"
        )
md5sums=('82128b2983b8242edb71f7903a8523e4'
         'adf65db864b108a7aecb9a85a3f4fd23'
         '372bc2ae40649891a51091808d1fe055'
         '97c02848a4a9b68dcb7ff1aef3bb3c42'
         '061fbf27180594c50c693da6cc49140e')

package() {
  cd $srcdir
  rm -rf *.[15]
  for f in *.[15]*; do mv "$f" "${f%%?attredirects=0&d=1}"; done
  for i in 1 5; do
    if [ ! -e "${pkgdir}/usr/share/man/ja_JP.UTF-8/man${i}/" ]; then
      mkdir -p "${pkgdir}/usr/share/man/ja_JP.UTF-8/man${i}/"
      chmod 755 "${pkgdir}/usr/share/man/ja_JP.UTF-8/man${i}/"
    fi

    # To copy a noexistent man only.
    for f in *.${i} ; do
      if [ ! -e /usr/share/man/ja_JP.UTF-8/man${i}/${f}.gz ]; then
        install -D -m644 ${f} "${pkgdir}/usr/share/man/ja_JP.UTF-8/man${i}/${f}"
      fi
    done
  done
}
