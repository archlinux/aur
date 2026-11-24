# Maintainer: lzsnyy <710080675@qq.com>
#
# Unofficial Linux port of the WorkBuddy international edition (workbuddy.ai),
# which publishes no Linux build.
#
# Layout: the application payload comes from the official Windows archive
# (win32-x64). Its app.asar is platform-neutral JavaScript, and it already
# carries the Linux builds of koffi, @lydell/node-pty and @ban-dal/os-bridge.
# The Electron runtime, the Node/Python session runtimes and the Linux CLI
# helpers (ripgrep, genie-trash) come from the official domestic-edition Linux
# deb. That deb's Electron carries the proprietary "workbuddyStorage" binding
# that sign-in depends on; stock Electron fails with
# CREDENTIAL_BOOTSTRAP_FAILED.
#
# Every artifact is pinned in source=() with a sha256, so makepkg downloads
# exactly what is audited here and the build itself runs fully offline.
#
# See DISCLAIMER and port.sh for the conversion steps.

pkgname=workbuddy-intl-agent
_pkgver=5.11.4.44121853
_build=0026dff0
_hostver=5.6.2.40046327
_hostbuild=c7b525f3
_electron=37.10.3
_sandbox=5.13.0
_harness=0.2.0-beta.16
pkgver=${_pkgver}_${_build}
pkgrel=4
pkgdesc='AI Agent for everyday office work - WorkBuddy international edition (unofficial Linux port)'
arch=('x86_64' 'aarch64')
url='https://www.workbuddy.ai'
license=('NOASSERTION')
depends=('libsecret' 'libappindicator-gtk3' 'nss' 'alsa-lib' 'gtk3' 'libxss' 'libnotify' 'mesa' 'xdg-utils')
makedepends=('nodejs' 'unzip' 'libarchive' 'file')
optdepends=('gnome-shell-extension-appindicator: tray icon support')
options=('!strip' '!debug')
provides=('workbuddy-international-bin')
conflicts=('workbuddy-international')

_win_archive="WorkBuddy-win32-x64-archive-${_pkgver}-${_build}.zip"
_win_url="https://download.codebuddy.ai/workbuddy/saas/win32-x64-archive/${_win_archive}"

source=(
  'port.sh'
  'asar.cjs'
  'patch.cjs'
  'verify-native.cjs'
  'start.sh'
  'workbuddy-international.desktop'
  'workbuddy-intl-256.png'
  'DISCLAIMER'
)
source_x86_64=(
  "${_win_archive}::${_win_url}"
  "WorkBuddy-linux-x64-deb-${_hostver}-${_hostbuild}.deb::https://download.codebuddy.cn/workbuddy/saas/linux-x64-deb/WorkBuddy-linux-x64-deb-${_hostver}-${_hostbuild}.deb"
  "sandbox-cli-linux-x64-${_sandbox}.tgz::https://registry.npmjs.org/@tencent-ai/sandbox-cli-linux-x64/-/sandbox-cli-linux-x64-${_sandbox}.tgz"
  "agent-harness-linux-x64-${_harness}.tgz::https://registry.npmjs.org/@tencent-ai/agent-harness-linux-x64/-/agent-harness-linux-x64-${_harness}.tgz"
)
source_aarch64=(
  "${_win_archive}::${_win_url}"
  "WorkBuddy-linux-arm64-deb-${_hostver}-${_hostbuild}.deb::https://download.codebuddy.cn/workbuddy/saas/linux-arm64-deb/WorkBuddy-linux-arm64-deb-${_hostver}-${_hostbuild}.deb"
  "sandbox-cli-linux-arm64-${_sandbox}.tgz::https://registry.npmjs.org/@tencent-ai/sandbox-cli-linux-arm64/-/sandbox-cli-linux-arm64-${_sandbox}.tgz"
  "agent-harness-linux-arm64-${_harness}.tgz::https://registry.npmjs.org/@tencent-ai/agent-harness-linux-arm64/-/agent-harness-linux-arm64-${_harness}.tgz"
)
noextract=(
  "${_win_archive}"
  "WorkBuddy-linux-x64-deb-${_hostver}-${_hostbuild}.deb"
  "WorkBuddy-linux-arm64-deb-${_hostver}-${_hostbuild}.deb"
  "sandbox-cli-linux-x64-${_sandbox}.tgz"
  "sandbox-cli-linux-arm64-${_sandbox}.tgz"
  "agent-harness-linux-x64-${_harness}.tgz"
  "agent-harness-linux-arm64-${_harness}.tgz"
)
sha256sums=(
  '109ee2757da34616207fc0e898a5f719b4290715eddf37f751d57e724b108fec'  # port.sh
  '8bd1111e94ec072bf7e751ba715e96abb4313cac6f7f86768d3eee9b7016c8c2'  # asar.cjs
  'e51c1f55b94e22ff64a5423c2172bc5ee73385592f972942c2403102966c0c42'  # patch.cjs
  '41c68cc72516123b85d7476c86dbd3ff8d7baecd0c1235be6be06549fa2efbac'  # verify-native.cjs
  '1aa43daf2f30f51bfdc46cc467c8d2145d9a59347b4f9caf4b42957a85c98bdf'  # start.sh
  '5350281f314d0eb5e6666238d76eefd622a6e7cc51e9c6d3904083f7d892c23a'  # desktop
  '631bd3aadd92f6e94797f299cfc9088149db3950e77fa99d090ccb6eff2253ee'  # icon
  '57d01c547f248e072b3824355de9a1566d0b28b99c47e36d7b467d4e945e3436'  # DISCLAIMER
)
sha256sums_x86_64=(
  '0ac85622e03d1f22645519a1d73861c80badad3cdf14d884ebcd6d6b491aa8b7'
  '12149ad8c0cd748fd5062d8f62c7827d688d8095427ada99b1ae9e7019897523'
  '7d025751a9005a182d1c2a99f4362454df494340cab27c8ddb625d9f0dd85785'
  '834fe6f1a07cecc42ffbd8ef263cc9a1eb08c515457ab1ca0121917cbb88ebe9'
)
sha256sums_aarch64=(
  '0ac85622e03d1f22645519a1d73861c80badad3cdf14d884ebcd6d6b491aa8b7'
  '561822578435d382a06d0a0b079a4b157f68b588c9fe72d589e2a88b2fd155fa'
  'b6cde29df99abf3b082cc8f1e10801f279712423c9727fd7386b295c8cb2c50a'
  '6651fa80faac30d822a9ee3e44f342db26f381110c5da5ef3b931eb8c7d4e704'
)

build() {
  local machine
  case "${CARCH}" in
    x86_64)
      machine=x64
      export HOST_DEB="${srcdir}/WorkBuddy-linux-x64-deb-${_hostver}-${_hostbuild}.deb"
      export SANDBOX_TGZ="${srcdir}/sandbox-cli-linux-x64-${_sandbox}.tgz"
      export HARNESS_TGZ="${srcdir}/agent-harness-linux-x64-${_harness}.tgz"
      ;;
    aarch64)
      machine=arm64
      export HOST_DEB="${srcdir}/WorkBuddy-linux-arm64-deb-${_hostver}-${_hostbuild}.deb"
      export SANDBOX_TGZ="${srcdir}/sandbox-cli-linux-arm64-${_sandbox}.tgz"
      export HARNESS_TGZ="${srcdir}/agent-harness-linux-arm64-${_harness}.tgz"
      ;;
    *)
      printf 'unsupported architecture: %s\n' "${CARCH}" >&2
      return 1
      ;;
  esac

  export WIN_ZIP="${srcdir}/${_win_archive}"
  export MACHINE="${machine}"
  export EXPECTED_ELECTRON="${_electron}"
  export EXPECTED_SANDBOX="${_sandbox}"
  export EXPECTED_HARNESS="${_harness}"
  export WORK_DIR="${srcdir}/build-work"
  export OUT_DIR="${srcdir}/app-out"
  export SCRIPT_DIR="${srcdir}"

  bash "${srcdir}/port.sh"

  # Smoke-test every native component against the runtimes we ship.
  ELECTRON_RUN_AS_NODE=1 "${srcdir}/app-out/workbuddy" \
    "${srcdir}/verify-native.cjs" "${srcdir}/app-out"
  "${srcdir}/app-out/resources/runtime/node/bin/node" \
    "${srcdir}/verify-native.cjs" "${srcdir}/app-out" --cli
}

package() {
  install -dm755 "${pkgdir}/opt/workbuddy-international"
  cp -a "${srcdir}/app-out/." "${pkgdir}/opt/workbuddy-international/"
  install -Dm755 "${srcdir}/start.sh" \
    "${pkgdir}/opt/workbuddy-international/start.sh"

  # Named after the window class pinned in start.sh so the task manager
  # associates windows with this entry and its icon.
  install -Dm644 "${srcdir}/workbuddy-international.desktop" \
    "${pkgdir}/usr/share/applications/workbuddy-international.desktop"

  install -Dm644 "${srcdir}/workbuddy-intl-256.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/workbuddy-international.png"
  install -Dm644 "${srcdir}/workbuddy-intl-256.png" \
    "${pkgdir}/usr/share/pixmaps/workbuddy-international.png"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/workbuddy-international" <<'LAUNCHER'
#!/bin/sh
exec /opt/workbuddy-international/start.sh "$@"
LAUNCHER

  install -Dm644 "${srcdir}/DISCLAIMER" \
    "${pkgdir}/usr/share/licenses/${pkgname}/DISCLAIMER"
}
