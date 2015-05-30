# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Dany Martineau <dany.luc.martineau at gmail.com>

pkgname=555-boom
pkgver=0.6.1
pkgrel=4
pkgdesc="Puzzle Game and Electromechanical Sandbox"
url="http://www.cosc.canterbury.ac.nz/greg.ewing/python/PyWeek5/index.html"
license=('GPL')
arch=('any')
depends=('python2-pygame')
source=(http://www.cosc.canterbury.ac.nz/greg.ewing/python/PyWeek5/5B-${pkgver}-Source.zip
            555-boom.desktop)
md5sums=('52a648e2c8d7e2efff0e1488a47c07ff'
                'b3f77a50856debc8d6b5bb98ade65f90')


prepare() {
    echo "#!/bin/bash" >> 555-boom.sh
    echo "cd /usr/share/555-boom/Game" >> 555-boom.sh
    echo "python2 run_game.py" >> 555-boom.sh
}

package() {
  cd ${srcdir}/5B-$pkgver-Source

  mkdir -p ${pkgdir}/usr/share/{555-boom,applications}
  cp -R * ${pkgdir}/usr/share/555-boom
  chmod 775 -R ${pkgdir}/usr/share/555-boom/{Saves,Mods}
  chmod 555 -R ${pkgdir}/usr/share/555-boom/Game/Resources/levels

  install -D -m 755 $srcdir/555-boom.sh ${pkgdir}/usr/bin/555-boom.sh
  cp ${srcdir}/555-boom.desktop ${pkgdir}/usr/share/applications
}
