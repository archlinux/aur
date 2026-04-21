# Maintainer: dougefresh <dchimento@gmail.com>
pkgbase=pi-coding-agent-git
pkgname=('pi-coding-agent-git'
    'pi-ext-doom-git'
    'pi-ext-todo-git'
    'pi-ext-git-checkpoint-git'
    'pi-ext-plan-mode-git'
    'pi-ext-auto-commit-git'
    'pi-ext-notify-git'
    'pi-ext-confirm-destructive-git'
    'pi-ext-protected-paths-git'
    'pi-ext-subagent-git'
    'pi-ext-session-name-git'
    'pi-ext-claude-rules-git'
    'pi-ext-send-user-message-git'
    'pi-ext-bookmark-git'
    'pi-ext-titlebar-spinner-git'
    'pi-ext-bash-spawn-hook-git'
)
_pkgname=pi-coding-agent
pkgdesc="Coding agent CLI with read, bash, edit, write tools and session management"
pkgver=0.68.0.r7.ga0a16c776
pkgrel=1
arch=('x86_64')
url="https://github.com/badlogic/pi-mono"
license=('MIT')
makedepends=('git' 'npm' 'typescript-go-git')
source=(
    "${_pkgname}::git+https://github.com/badlogic/pi-mono"
    'pi-wrapper'
    'doom-wad-path.patch'
    'APPEND_SYSTEM.md.example'
    'https://distro.ibiblio.org/slitaz/sources/packages/d/doom1.wad'
)
sha256sums=('SKIP' '7883f9bdeeec04f9e06584ac4b4d55c813377f924623b8dd3b58b1465ab82fa6' '920a24f42039b51685b619f936f4c04de498df4bd757ad48b9bf6b41c4280da5' 'SKIP' '1d7d43be501e67d927e415e0b8f3e29c3bf33075e859721816f652a526cac771')
options=('!strip' '!debug')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
    cd "$srcdir/$_pkgname"
}

build() {
    cd "$srcdir/$_pkgname"
    npm ci --no-audit --no-fund
    npm run build
    npm prune --omit=dev --no-audit --no-fund
}

package_pi-coding-agent-git() {
    depends=('nodejs')
    conflicts=('pi-coding-agent')
    provides=('pi-coding-agent')
    install=pi-coding-agent-git.install

    # wrapper script
    install -Dm755 "$srcdir/pi-wrapper" "$pkgdir/usr/bin/pi"

    # install monorepo to /usr/lib/node_modules/pi-coding-agent
    cd "$srcdir/$_pkgname"
    local _destdir="$pkgdir/usr/lib/node_modules/$_pkgname"
    mkdir -p "$_destdir"
    cp -a package.json node_modules packages "$_destdir/"

    # docs
    install -Dm644 packages/coding-agent/README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
    install -Dm644 "$srcdir/APPEND_SYSTEM.md.example" "$pkgdir/usr/share/doc/$_pkgname/APPEND_SYSTEM.md.example"
}

package_pi-ext-doom-git() {
    pkgdesc="Required extension for full productivity"
    conflicts=('pi-ext-doom')
    provides=('pi-ext-doom')
    install=pi-ext-git.install

    cd "$srcdir/$_pkgname"
    mkdir -p "$pkgdir/usr/share/pi/extensions"
    cp -a packages/coding-agent/examples/extensions/doom-overlay "$pkgdir/usr/share/pi/extensions/"

    # shareware WAD
    install -Dm644 "$srcdir/doom1.wad" "$pkgdir/usr/share/games/doom/doom1.wad"
}

package_pi-ext-todo-git() {
    pkgdesc="Todo list extension"
    conflicts=('pi-ext-todo')
    provides=('pi-ext-todo')
    install=pi-ext-git.install

    cd "$srcdir/$_pkgname"
    mkdir -p "$pkgdir/usr/share/pi/extensions"
    cp -a packages/coding-agent/examples/extensions/todo.ts "$pkgdir/usr/share/pi/extensions/todo.ts"
}

package_pi-ext-git-checkpoint-git() {
    pkgdesc="Git checkpoint extension"
    conflicts=('pi-ext-git-checkpoint')
    provides=('pi-ext-git-checkpoint')
    install=pi-ext-git.install

    cd "$srcdir/$_pkgname"
    mkdir -p "$pkgdir/usr/share/pi/extensions"
    cp -a packages/coding-agent/examples/extensions/git-checkpoint.ts "$pkgdir/usr/share/pi/extensions/git-checkpoint.ts"
}

package_pi-ext-plan-mode-git() {
    pkgdesc="Plan mode extension"
    conflicts=('pi-ext-plan-mode')
    provides=('pi-ext-plan-mode')
    install=pi-ext-git.install

    cd "$srcdir/$_pkgname"
    mkdir -p "$pkgdir/usr/share/pi/extensions"
    cp -a packages/coding-agent/examples/extensions/plan-mode "$pkgdir/usr/share/pi/extensions/plan-mode"
}

package_pi-ext-auto-commit-git() {
    pkgdesc="Auto commit on exit extension"
    conflicts=('pi-ext-auto-commit')
    provides=('pi-ext-auto-commit')
    install=pi-ext-git.install

    cd "$srcdir/$_pkgname"
    mkdir -p "$pkgdir/usr/share/pi/extensions"
    cp -a packages/coding-agent/examples/extensions/auto-commit-on-exit.ts "$pkgdir/usr/share/pi/extensions/auto-commit-on-exit.ts"
}

package_pi-ext-notify-git() {
    pkgdesc="Notification extension"
    conflicts=('pi-ext-notify')
    provides=('pi-ext-notify')
    install=pi-ext-git.install

    cd "$srcdir/$_pkgname"
    mkdir -p "$pkgdir/usr/share/pi/extensions"
    cp -a packages/coding-agent/examples/extensions/notify.ts "$pkgdir/usr/share/pi/extensions/notify.ts"
}

package_pi-ext-confirm-destructive-git() {
    pkgdesc="Confirm destructive operations"
    conflicts=('pi-ext-confirm-destructive')
    provides=('pi-ext-confirm-destructive')
    install=pi-ext-git.install

    cd "$srcdir/$_pkgname"
    mkdir -p "$pkgdir/usr/share/pi/extensions"
    cp -a packages/coding-agent/examples/extensions/confirm-destructive.ts "$pkgdir/usr/share/pi/extensions/confirm-destructive.ts"
}

package_pi-ext-protected-paths-git() {
    pkgdesc="PI Protected paths extension"
    conflicts=('pi-ext-protected-paths')
    provides=('pi-ext-protected-paths')
    install=pi-ext-git.install

    cd "$srcdir/$_pkgname"
    mkdir -p "$pkgdir/usr/share/pi/extensions"
    cp -a packages/coding-agent/examples/extensions/protected-paths.ts "$pkgdir/usr/share/pi/extensions/protected-paths.ts"
}

package_pi-ext-subagent-git() {
    pkgdesc="PI Subagent extension"
    conflicts=('pi-ext-subagent')
    provides=('pi-ext-subagent')
    install=pi-ext-git.install

    cd "$srcdir/$_pkgname"
    mkdir -p "$pkgdir/usr/share/pi/extensions"
    cp -a packages/coding-agent/examples/extensions/subagent "$pkgdir/usr/share/pi/extensions/subagent"
}

package_pi-ext-session-name-git() {
    _extname="session-name"
    pkgdesc="PI Extension ${_extname}"
    conflicts=("pi-ext-${_extname}")
    provides=("pi-ext-${_extname}")
    install=pi-ext-git.install

    cd "$srcdir/$_pkgname"
    mkdir -p "$pkgdir/usr/share/pi/extensions"
    cp -a packages/coding-agent/examples/extensions/${_extname}.ts "$pkgdir/usr/share/pi/extensions/${_extname}.ts"
}

package_pi-ext-bookmark-git() {
    _extname="bookmark"
    pkgdesc="PI Extension ${_extname}"
    conflicts=("pi-ext-${_extname}")
    provides=("pi-ext-${_extname}")
    install=pi-ext-git.install

    cd "$srcdir/$_pkgname"
    mkdir -p "$pkgdir/usr/share/pi/extensions"
    cp -a packages/coding-agent/examples/extensions/${_extname}.ts "$pkgdir/usr/share/pi/extensions/${_extame}.ts"
}

package_pi-ext-claude-rules-git() {
    _extname="claude-rules"
    pkgdesc="PI Extension ${_pkgname}"
    conflicts=("pi-ext-${_pkgname}")
    provides=("pi-ext-${_pkgname}")
    install=pi-ext-git.install

    cd "$srcdir/$_pkgname"
    mkdir -p "$pkgdir/usr/share/pi/extensions"
    cp -a packages/coding-agent/examples/extensions/${_extname}.ts "$pkgdir/usr/share/pi/extensions/${_extname}.ts"
}

package_pi-ext-send-user-message-git() {
    _extname="send-user-message"
    pkgdesc="PI Extension ${_pkgname}"
    conflicts=("pi-ext-${_extname}")
    provides=("pi-ext-${_extname}")
    install=pi-ext-git.install

    cd "$srcdir/$_pkgname"
    mkdir -p "$pkgdir/usr/share/pi/extensions"
    cp -a packages/coding-agent/examples/extensions/${_extname}.ts "$pkgdir/usr/share/pi/extensions/${_extname}.ts"
}

package_pi-ext-titlebar-spinner-git() {
    _extname="titlebar-spinner"
    pkgdesc="PI Extension ${_extname}"
    conflicts=("pi-ext-${_extname}")
    provides=("pi-ext-${_extname}")
    install=pi-ext-git.install

    cd "$srcdir/$_pkgname"
    mkdir -p "$pkgdir/usr/share/pi/extensions"
    cp -a packages/coding-agent/examples/extensions/${_extname}.ts "$pkgdir/usr/share/pi/extensions/${_extname}.ts"
}


package_pi-ext-bash-spawn-hook-git() {
    _extname="bash-spawn-hook"
    pkgdesc="PI Extension ${_extname}"
    conflicts=("pi-ext-${_extname}")
    provides=("pi-ext-${_extname}")
    install=pi-ext-git.install

    cd "$srcdir/$_pkgname"
    mkdir -p "$pkgdir/usr/share/pi/extensions"
    cp -a packages/coding-agent/examples/extensions/${_extname}.ts "$pkgdir/usr/share/pi/extensions/${_extname}.ts"
}

package_pi-ext-sandbox-git() {
    depends=('pi-coding-agent-git')
    conflicts=('pi-ext-sandbox')
    install=pi-ext-git.install
    pkgdesc="PI Sanbox extension"
    provides=('pi-ext-sandbox')

    cd "$srcdir/$_pkgname/packages/coding-agent/examples/extensions"
    npm ci --no-audit --no-fund
    mkdir -p "$pkgdir/usr/share/pi/extensions"
    cp -a packages/coding-agent/examples/extensions/sandbox "$pkgdir/usr/share/pi/extensions/sandbox"
}
