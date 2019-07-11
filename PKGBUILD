# Maintainer: Donald Webster <fryfrog@gmail.com>
# Maintainer: Zack Baldwin <zack@zackb.com>

pkgname=fanshim
pkgver=0.0.2
pkgrel=1
pkgdesc="Automatic control of Pimoroni Fan Shim for Raspberry Pi."
arch=('any')
url="https://github.com/pimoroni/fanshim-python"
license=('MIT')
depends=('python-fanshim')

source=("fanshim-${pkgver}.py::https://raw.githubusercontent.com/pimoroni/fanshim-python/master/examples/automatic.py"
        'fanshim.service')

sha512sums=('cfcd1e32bf1e632dc10e555a0952f7582a68f3b677cc4753617e4e26d48034fece0694d6aeb8224ec7d2397779aa07faa978fc79e6b9b0391f17594a8f0439e0'
            '7dd5b37cd81a7001d5f3d09461889294b6b38bcfb7274a4a5c0c558492454ad58bb03822de1ce023c7221b91886f5eff0b07a56ea88a34774e971a4ee1773b26')

package() {
  install -D -m 755 "${srcdir}/fanshim-${pkgver}.py" "${pkgdir}/usr/bin/fanshim"

  # For some reason, psutil on Arch is cpu_thermal, not cpu-thermal.
  sed -i 's/cpu-thermal/cpu_thermal/' "${pkgdir}/usr/bin/fanshim"

  install -D -m 644 "${srcdir}/fanshim.service" "${pkgdir}/usr/lib/systemd/system/fanshim.service"
}

# vim:set ts=2 sw=2 et:
